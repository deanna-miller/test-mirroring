- view: claim_status_template
  #sql_table_name: insight.claim_status
  derived_table:
    sql: |
      Select 
        to_date(nvl(featurekpi.rperiod,claimkpi.report_period),'YYYYMM') as reportperiod,
        nvl(featurekpi.rperiod,claimkpi.report_period) as reportpd,
        nvl(featurekpi.claim_num,claimkpi.claim_number) as claimnumber,
        featurekpi.claimant_code as claimantcode,
        featurekpi.feature_code as featurecode,
        featurekpi.update_date as  featureupdatedate,
        featurekpi.featurestatus,
        featurekpi.featurestatactivity,
        featurekpi.featurecloseddate,
        featurekpi.featurereopendate,
        featurekpi.featureopendate,
        featurekpi.featureopenedinmonth,
        featurekpi.adjuster,
        featurekpi.adjusterref,
        featurekpi.exaiminer,
        featurekpi.exaiminerref,
        featurekpi.featureclosedinmonth,
        featurekpi.featurereopeninmonth,
        featurekpi.featuredaysopen,
        featurekpi.featuretotaldaysopen,
        featurekpi.featureclosednopayitd,
        featurekpi.featureclosednopayytd,
        featurekpi.featureclosednopaymtd,
        featurekpi.featurezerooutstanding,
        featurekpi.featureclosed500lessitd,
        featurekpi.featureclosed500lessytd,
        featurekpi.featureclosed500lessmtd,
        featurekpi.featureclosed1000lessitd,
        featurekpi.featureclosed1000lessytd,
        featurekpi.featureclosed1000lessmtd,
        claimkpi.updatedate as claimupdatedate,
        claimkpi.claimstatus as claimstatus,
        claimkpi.statactivity as claimstatusactivity,
        claimkpi.closeddate,
        claimkpi.reopendate,
        claimkpi.claimadddt,
        claimkpi.openedinmonth,
        claimkpi.openedinyear,
        claimkpi.reportinmonth,
        claimkpi.reportinyear,
        claimkpi.occurredinmonth,
        claimkpi.daystoopen,
        claimkpi.daystoreport,
        claimkpi.shortdesc,
        claimkpi.reportedby,
        claimkpi.reportedto,
        claimkpi.insiuind,
        claimkpi.doicomplaintind,
        claimkpi.suitfiledind,
        claimkpi.fraudscore,
        claimkpi.fraudscoredescription,
        claimkpi.closedinmonth,
        claimkpi.closedinyear,
        claimkpi.reopeninmonth,
        claimkpi.daysopen,
        claimkpi.totaldaysopen,
        claimkpi.closednopayitd,
        claimkpi.closednopayytd,
        claimkpi.closednopaymtd,
        claimkpi.closednopayitdyearend,
        claimkpi.closednopayytdyearend,
        claimkpi.zerooutstanding,
        claimkpi.closed500lessitd,
        claimkpi.closed500lessytd,
        claimkpi.closed500lessmtd,
        claimkpi.closed1000lessitd,
        claimkpi.closed1000lessytd,
        claimkpi.closed1000lessmtd
      From
      (
      Select
            feature1.reportperiod as rperiod,
            feature1.claimnumber as claim_num,
            feature1.claimantcd as claimant_code,
            feature1.featurecd as feature_code,
            feature1.updatedt as update_date, 
            feature1.featurestatus,
            feature1.featurestatactivity,
            feature1.featurecloseddate,
            feature1.featurereopendate,
            feature1.featureopendate,
            feature1.featureopenedinmonth,
            feature1.adjuster,
            feature1.adjusterref,
            feature1.exaiminer,
            feature1.exaiminerref,
            Case When (Cast(Datepart(Year,feature1.featurecloseddate) As varchar) + Right('00'+ Cast(Datepart(Month,feature1.featurecloseddate) As varChar), 2)) = feature1.reportperiod
                             Then 'Yes'
                             Else 'No'
                       End As featureclosedinmonth,
            Case When (Cast(Datepart(Year,feature1.featurereopendate) As varchar) + Right('00'+ Cast(Datepart(Month,feature1.featurereopendate) As varChar), 2)) = feature1.reportperiod
                             Then 'Yes'
                             Else 'No'
                       End As featurereopeninmonth,    
            Case When Left(feature1.featurestatus,6) = 'Closed' 
                        Then datediff(days,isnull(feature1.featurereopendate,feature1.featureopendate),feature1.featurecloseddate)
                        Else Case When Left(feature1.featurestatus,6) = 'Reopen' 
                             Then datediff(days,feature1.featurereopendate,feature1.updatedt)
                             Else datediff(days,feature1.featureopendate,feature1.updatedt) 
                             End
                   End As featuredaysopen,
            Case When Left(feature1.featurestatus,6) = 'Closed' 
                        Then datediff(days,feature1.featureopendate,feature1.featurecloseddate)
                        Else datediff(days,feature1.featureopendate,feature1.updatedt) 
                   End As featuretotaldaysopen,
            Case When (Cast(Datepart(Year,feature1.featurecloseddate) As varchar) + Right('00'+ Cast(Datepart(Month,feature1.featurecloseddate) As varChar), 2)) = feature1.reportperiod and featurepay.itdpaid  = 0 
                            Then  'Yes' 
                            Else 'No'
                   End As featureclosednopayitd,
            Case When (Cast(Datepart(Year,feature1.featurecloseddate) As varchar) + Right('00'+ Cast(Datepart(Month,feature1.featurecloseddate) As varChar), 2)) = feature1.reportperiod and featurepay.ytdpaid  = 0 
                            Then  'Yes' 
                            Else 'No' 
                   End As featureclosednopayytd,
            Case When (Cast(Datepart(Year,feature1.featurecloseddate) As varchar) + Right('00'+ Cast(Datepart(Month,feature1.featurecloseddate) As varChar), 2)) = feature1.reportperiod Then 
                            Case When featurepay.mtdpaid  = 0 Then  'Yes' Else 'No' End
                        Else Null
                   End As featureclosednopaymtd,
            Case When featurepay.outstanding = 0 Then 'Yes'
                        Else 'No'
                   End As featurezerooutstanding,
            Case When (Cast(Datepart(Year,feature1.featurecloseddate) As varchar) + Right('00'+ Cast(Datepart(Month,feature1.featurecloseddate) As varChar), 2)) = feature1.reportperiod and featurepay.itdpaid  <= 500 
                            Then  'Yes' 
                            Else 'No' 
                   End As featureclosed500lessitd,
            Case When (Cast(Datepart(Year,feature1.featurecloseddate) As varchar) + Right('00'+ Cast(Datepart(Month,feature1.featurecloseddate) As varChar), 2)) = feature1.reportperiod and featurepay.ytdpaid  <= 500 
                            Then  'Yes' 
                            Else 'No' 
                   End As featureclosed500lessytd,
            Case When (Cast(Datepart(Year,feature1.featurecloseddate) As varchar) + Right('00'+ Cast(Datepart(Month,feature1.featurecloseddate) As varChar), 2)) = feature1.reportperiod and featurepay.mtdpaid <= 500 
                            Then  'Yes' 
                            Else 'No' 
                   End As featureclosed500lessmtd,
            Case When (Cast(Datepart(Year,feature1.featurecloseddate) As varchar) + Right('00'+ Cast(Datepart(Month,feature1.featurecloseddate) As varChar), 2)) = feature1.reportperiod and featurepay.itdpaid  <= 1000 
                            Then  'Yes' 
                            Else 'No' 
                   End As featureclosed1000lessitd,
            Case When (Cast(Datepart(Year,feature1.featurecloseddate) As varchar) + Right('00'+ Cast(Datepart(Month,feature1.featurecloseddate) As varChar), 2)) = feature1.reportperiod 
                and featurepay.ytdpaid  <= 1000 
                  Then  'Yes' 
                  Else 'No' 
                   End As featureclosed1000lessytd,
            Case When (Cast(Datepart(Year,feature1.featurecloseddate) As varchar) + Right('00'+ Cast(Datepart(Month,feature1.featurecloseddate) As varChar), 2)) = feature1.reportperiod  and featurepay.mtdpaid <= 1000 
                            Then  'Yes' 
                            Else 'No' 
                   End As featureclosed1000lessmtd
      From
      
         (
          Select fstatus.reportperiod,fstatus.claimnumber,fstatus.claimantcd,fstatus.featurecd,fstatus.updatedt,
                 Case When fstatus.featurestatus  isNull Then lag(fstatus.featurestatus,1)  Ignore Nulls over (Partition by fstatus.claimnumber,fstatus.claimantcd,fstatus.featurecd order by fstatus.reportperiod)
                 Else fstatus.featurestatus
                 End, 
                 fstatus.featurestatactivity,
                 Case When fstatus.featurecloseddate  isNull Then lag(fstatus.featurecloseddate,1)  Ignore Nulls over (Partition by fstatus.claimnumber,fstatus.claimantcd,fstatus.featurecd order by fstatus.reportperiod)
                 Else fstatus.featurecloseddate
                 End,
                 Case When fstatus.featurereopendate  isNull Then lag(fstatus.featurereopendate,1)  Ignore Nulls over (Partition by fstatus.claimnumber,fstatus.claimantcd,fstatus.featurecd order by fstatus.reportperiod)
                 Else fstatus.featurereopendate
                 End,
                 opendt.featureopendate,  
                 Case When (Cast(Datepart(Year,opendt.featureopendate) As varchar) + Right('00'+ Cast(Datepart(Month,opendt.featureopendate) As varChar), 2)) = fstatus.reportperiod
                       Then 'Yes'
                       Else 'No'
                 End As featureopenedinmonth,
                 Case When fstatus.adjuster  isNull Then lag(fstatus.adjuster,1)  Ignore Nulls over (Partition by fstatus.claimnumber,fstatus.claimantcd,fstatus.featurecd order by fstatus.reportperiod)
                 Else fstatus.adjuster
                 End, 
                 Case When fstatus.adjusterref  isNull Then lag(fstatus.adjusterref,1)  Ignore Nulls over (Partition by fstatus.claimnumber,fstatus.claimantcd,fstatus.featurecd order by fstatus.reportperiod)
                 Else fstatus.adjusterref
                 End, 
                 Case When fstatus.exaiminer  isNull Then lag(fstatus.exaiminer,1)  Ignore Nulls over (Partition by fstatus.claimnumber,fstatus.claimantcd,fstatus.featurecd order by fstatus.reportperiod)
                 Else fstatus.exaiminer
                 End, 
                 Case When fstatus.exaiminerref  isNull Then lag(fstatus.exaiminerref,1)  Ignore Nulls over (Partition by fstatus.claimnumber,fstatus.claimantcd,fstatus.featurecd order by fstatus.reportperiod)
                 Else fstatus.exaiminerref
                 End
          From
          (
              Select fpclm.reportperiod,fpclm.claimnumber,fpclm.claimantcd,fpclm.featurecd,fpclm.updatedt,featurestatus.featurestatus,featurestatus.featurestatactivity,featurestatus.featurecloseddate,featurestatus.featurereopendate
              ,featurestatus.adjuster,featurestatus.adjusterref, featurestatus.exaiminer, featurestatus.exaiminerref
              From
              (
              Select distinct reportperiod,claimnumber,claimantcd,featurecd,updatedt
              From dw.claimsummarystats
              ) fpclm
              Left Join
              (
                Select 
                      ft3.reportperiod As reportperiod,
                      ft3.updatedt As statusdt,
                      ft4.claimnumber As claimnumber,             
                      ft4.claimantcd As claimantcd,
                      ft4.featurecd As featurecd,
                      ft4.featurestatuscd As featurestatus,
                      ft4.adjusterprovidercd As adjuster,
                      ft4.adjusterproviderref As adjusterref,
                      ft4.examinerprovidercd As exaiminer,
                      ft4.examinerproviderref As exaiminerref,
                      'Yes' As featurestatactivity,
                      Case When Left(ft4.featurestatuscd,6) = 'Closed' then updatedt else Null End As featurecloseddate,
                      Case When Left(ft4.featurestatuscd,6) = 'Reopen' then updatedt else Null End As featurereopendate
                From
                     (  
                      Select  
                           Max(ft1.maxsystemid) As id,
                           Max(ft1.bookdt) As updatedt, 
                           Cast(Datepart(Year,Max(ft1.bookdt)) As varchar) + Right('00'+ Cast(Datepart(Month,Max(ft1.bookdt)) As varChar), 2) As reportperiod, 
                           ft1.claimnumber, ft1.claimantcd,ft1.featurecd
                       From
                           (Select bookdt,
                                   claimnumber,
                                   claimantcd,
                                   featurecd, 
                                   max(systemid) as maxsystemid  
                            From dw.claimstats
                            Group By bookdt,claimnumber,claimantcd,featurecd
                            Having max(systemid)) ft1   
                            Left Join
                            dw.claimstats ft2
                            On ft1.maxsystemid = ft2.systemid 
                            Group By 
                            Cast(Datepart(Year,ft1.bookdt) As varchar) + Right('00'+ Cast(Datepart(Month,ft1.bookdt) As varChar), 2), 
                            ft1.claimnumber, ft1.claimantcd,ft1.featurecd
                            Having Max(ft1.maxsystemid)          
                      ) ft3
                      Left Join 
                      dw.claimstats ft4  
                      On ft3.id = ft4.systemid     
          ) featurestatus
              On fpclm.reportperiod = featurestatus.reportperiod 
              and fpclm.claimnumber = featurestatus.claimnumber 
              and fpclm.claimantcd = featurestatus.claimantcd 
              and fpclm.featurecd = featurestatus.featurecd
          ) fstatus
          Left Join 
          (
          Select claimnumber,claimantcd,featurecd, min(adddt) as featureopendate
          From dw.claimstats 
          group by claimnumber,claimantcd,featurecd
          ) opendt
          On fstatus.claimnumber = opendt.claimnumber and fstatus.claimantcd = opendt.claimantcd and fstatus.featurecd = opendt.featurecd
          ) feature1
          Left Join
          (Select css.reportperiod,css.claimnumber,css.claimantcd,css.featurecd,
                         Sum(itdpaidamt) As itdpaid,
                         Sum(mtdpaidamt) As mtdpaid,
                         Sum(ytdpaidamt) As ytdpaid,
                         Sum(outstandingamt)  As outstanding
          From dw.claimsummarystats css
          Group By css.reportperiod,css.claimnumber,css.claimantcd,css.featurecd
          ) featurepay
           On feature1.reportperiod = featurepay.reportperiod 
              and feature1.claimnumber = featurepay.claimnumber 
              and feature1.claimantcd = featurepay.claimantcd 
              and feature1.featurecd = featurepay.featurecd
      
      ) featurekpi
      Full Outer Join 
      (
      Select   ckpi1.reportperiod as report_period,
               ckpi1.claimnumber as claim_number,
               ckpi1.updatedt as updatedate,
               ckpi1.statactivity,
               ckpi1.status as claimstatus,
               ckpi1.closeddate,
               ckpi1.reopendate,
               ckpi1.claimadddt,
               ckpi1.openedinmonth,
               ckpi1.openedinyear,
               ckpi1.reportinmonth,
               ckpi1.reportinyear,
               ckpi1.occurredinmonth,
               ckpi1.daystoopen,
               ckpi1.daystoreport,
               ckpi1.shortdesc,
               ckpi1.reportedby,
               ckpi1.reportedto,
               ckpi1.insiuind,
               ckpi1.doicomplaintind,
               ckpi1.suitfiledind,
               ckpi1.fraudscore,
               ckpi1.fraudscoredescription,
               Case When (Cast(Datepart(Year,ckpi1.closeddate) As varchar) + Right('00'+ Cast(Datepart(Month,ckpi1.closeddate) As varChar), 2)) = ckpi1.reportperiod
                         Then 'Yes'
                         Else 'No'
                   End As closedinmonth,
               Case When Cast(Datepart(Year,ckpi1.closeddate) As varchar)  = Left(ckpi1.reportperiod,4) and ckpi1.status = 'Closed'
                         Then 'Yes'
                         Else 'No'
                   End As closedinyear,    
               Case When (Cast(Datepart(Year,ckpi1.reopendate) As varchar) + Right('00'+ Cast(Datepart(Month,ckpi1.reopendate) As varChar), 2)) = ckpi1.reportperiod
                         Then 'Yes'
                         Else 'No'
                   End As reopeninmonth,    
               Case When Left(ckpi1.status,6) = 'Closed' 
                    Then datediff(days,isnull(ckpi1.reopendate,ckpi1.claimadddt),ckpi1.closeddate)
                    Else Case When Left(ckpi1.status,6) = 'Reopen' 
                         Then datediff(days,ckpi1.reopendate,ckpi1.updatedt)
                         Else datediff(days,ckpi1.claimadddt,ckpi1.updatedt) 
                         End
               End As daysopen,
                  Case When Left(ckpi1.status,6) = 'Closed' 
                    Then datediff(days,ckpi1.claimadddt,ckpi1.closeddate)
                    Else datediff(days,ckpi1.claimadddt,ckpi1.updatedt) 
               End As totaldaysopen,
               Case When (Cast(Datepart(Year,ckpi1.closeddate) As varchar) + Right('00'+ Cast(Datepart(Month,ckpi1.closeddate) As varChar), 2)) = ckpi1.reportperiod and 
                        ckpi2.itdpaid  = 0 
                    Then  'Yes' 
                    Else 'No' 
               End As closednopayitd,
                Case When (Cast(Datepart(Year,ckpi1.closeddate) As varchar) + Right('00'+ Cast(Datepart(Month,ckpi1.closeddate) As varChar), 2)) = ckpi1.reportperiod  
                        and ckpi2.ytdpaid  = 0 
                    Then  'Yes' 
                    Else 'No' 
               End As closednopayytd,
               Case When (Cast(Datepart(Year,ckpi1.closeddate) As varchar) + Right('00'+ Cast(Datepart(Month,ckpi1.closeddate) As varChar), 2)) = ckpi1.reportperiod and ckpi2.mtdpaid  = 0 
                    Then  'Yes' 
                    Else 'No' 
               End As closednopaymtd,
               Case When Cast(Datepart(Year,ckpi1.closeddate) As varchar)  = Left(ckpi1.reportperiod,4) and ckpi1.status = 'Closed' and ckpi2.itdpaid  = 0 
                    Then  'Yes' 
                    Else 'No' 
               End As closednopayitdyearend,
               Case When Cast(Datepart(Year,ckpi1.closeddate) As varchar)  = Left(ckpi1.reportperiod,4) and ckpi1.status = 'Closed' and ckpi2.ytdpaid  = 0 
                  Then  'Yes' 
                  Else 'No' 
                  End As closednopayytdyearend,
               Case When outstanding = 0 Then 'Yes'
                    Else 'No'
               End As zerooutstanding,
                 Case When (Cast(Datepart(Year,ckpi1.closeddate) As varchar) + Right('00'+ Cast(Datepart(Month,ckpi1.closeddate) As varChar), 2)) = ckpi1.reportperiod and
                        ckpi2.itdpaid  <= 500 
                        Then  'Yes' 
                        Else 'No' 
               End As closed500lessitd,
                Case When (Cast(Datepart(Year,ckpi1.closeddate) As varchar) + Right('00'+ Cast(Datepart(Month,ckpi1.closeddate) As varChar), 2)) = ckpi1.reportperiod and ckpi2.ytdpaid  <= 500 
                  Then  'Yes' 
                  Else 'No' 
               End As closed500lessytd,
                Case When (Cast(Datepart(Year,ckpi1.closeddate) As varchar) + Right('00'+ Cast(Datepart(Month,ckpi1.closeddate) As varChar), 2)) = ckpi1.reportperiod   
                        and ckpi2.mtdpaid <= 500 
                        Then  'Yes' 
                        Else 'No' 
               End As closed500lessmtd,
               Case When (Cast(Datepart(Year,ckpi1.closeddate) As varchar) + Right('00'+ Cast(Datepart(Month,ckpi1.closeddate) As varChar), 2)) = ckpi1.reportperiod and
                         ckpi2.itdpaid  <= 1000 
                         Then  'Yes' 
                         Else 'No' 
               End As closed1000lessitd,
                Case When (Cast(Datepart(Year,ckpi1.closeddate) As varchar) + Right('00'+ Cast(Datepart(Month,ckpi1.closeddate) As varChar), 2)) = ckpi1.reportperiod and
                         ckpi2.ytdpaid  <= 1000 
                         Then  'Yes' 
                         Else 'No'
               End As closed1000lessytd,
               Case When (Cast(Datepart(Year,ckpi1.closeddate) As varchar) + Right('00'+ Cast(Datepart(Month,ckpi1.closeddate) As varChar), 2)) = ckpi1.reportperiod and
                         ckpi2.mtdpaid <= 1000 
                         Then  'Yes' 
                         Else 'No'
               End As closed1000lessmtd
        From 
        (
            Select cstatus.reportperiod,cstatus.claimnumber,cstatus.updatedt,
                   Case When cstatus.status  isNull Then lag(cstatus.status,1)  Ignore Nulls over (Partition by cstatus.claimnumber order by cstatus.reportperiod)
                   Else cstatus.status
                   End, 
                   cstatus.statactivity,
                   Case When cstatus.closeddate  isNull Then lag(cstatus.closeddate,1)  Ignore Nulls over (Partition by cstatus.claimnumber order by cstatus.reportperiod)
                   Else cstatus.closeddate
                   End,
                   Case When cstatus.reopendate  isNull Then lag(cstatus.reopendate,1)  Ignore Nulls over (Partition by cstatus.claimnumber order by cstatus.reportperiod)
                   Else cstatus.reopendate
                   End,
                   c.adddt As claimadddt,
                   Case When (Cast(Datepart(Year,c.adddt) As varchar) + Right('00'+ Cast(Datepart(Month,c.adddt) As varChar), 2)) = cstatus.reportperiod
                         Then 'Yes'
                         Else 'No'
                   End As openedinmonth,
                    Case When Cast(Datepart(Year,c.adddt) As varchar)  = Left(cstatus.reportperiod,4)
                         Then 'Yes'
                         Else 'No'
                   End As openedinyear,
                   Case When (Cast(Datepart(Year,c.reporteddt) As varchar) + Right('00'+ Cast(Datepart(Month,c.reporteddt) As varChar), 2)) = cstatus.reportperiod
                         Then 'Yes'
                         Else 'No'
                   End As reportinmonth,
                  Case When Cast(Datepart(Year,c.reporteddt) As varchar) = Left(cstatus.reportperiod,4)
                         Then 'Yes'
                         Else 'No'
                   End As reportinyear,
                   Case When (Cast(Datepart(Year,c.lossdt) As varchar) + Right('00'+ Cast(Datepart(Month,c.lossdt) As varChar), 2)) = cstatus.reportperiod
                         Then 'Yes'
                         Else 'No'
                   End As occurredinmonth,
                   datediff(days,c.lossdt,c.adddt) As daystoopen,
                   datediff(days,c.lossdt,c.reporteddt) As daystoreport,
                   c.shortdesc,
                   c.reportedby,
                   c.reportedto,
                   c.insiuind,
                   c.doicomplaintind,
                   c.suitfiledind,
                   Null As fraudscore,
                   Null As fraudscoredescription
            From
            (
                Select rpclm.reportperiod,rpclm.claimnumber,rpclm.updatedt,status.status,status.statactivity,status.closeddate,status.reopendate
                From
                (
                Select distinct reportperiod,claimnumber,updatedt
                From dw.claimsummarystats
                ) rpclm
                Left Join
                (
                  Select 
                        st3.reportperiod As reportperiod,
                        st3.updatedt As statusdt,
                        st4.claimnumber As claimnumber,
                        st4.claimstatuscd As status,
                        'Yes' As statactivity,
                        Case When Left(st4.claimstatuscd,6) = 'Closed' then updatedt else Null End As closeddate,
                        Case When Left(st4.claimstatuscd,6) = 'Reopen' then updatedt else Null End As reopendate
                  From
                       (  
                        Select  
                             Max(st1.maxsystemid) As id,
                             Max(st1.bookdt) As updatedt, 
                             Cast(Datepart(Year,Max(st1.bookdt)) As varchar) + Right('00'+ Cast(Datepart(Month,Max(st1.bookdt)) As varChar), 2) As reportperiod, 
                             st1.claimnumber
                         From
                             (Select bookdt,
                                     claimnumber, 
                                     max(systemid) as maxsystemid  
                              From dw.claimstats
                              Group By bookdt,claimnumber 
                              Having max(systemid)) st1   
                              Left Join
                              dw.claimstats st2
                              On st1.maxsystemid = st2.systemid 
                              Group By 
                              Cast(Datepart(Year,st1.bookdt) As varchar) + Right('00'+ Cast(Datepart(Month,st1.bookdt) As varChar), 2), 
                              st1.claimnumber
                              Having Max(st1.maxsystemid)          
                        ) st3
                        Left Join 
                        dw.claimstats st4  
                        On st3.id = st4.systemid     
            ) status
                On rpclm.reportperiod = status.reportperiod and rpclm.claimnumber = status.claimnumber
            ) cstatus
            Left Join dw.claim c
            On cstatus.claimnumber = c.claimnumber
        ) ckpi1
        Left Join
        (
        Select reportperiod,claimnumber,
               Sum(itdpaidamt) As itdpaid,
               Sum(mtdpaidamt) As mtdpaid,
               Sum(ytdpaidamt) As ytdpaid,
               Sum(outstandingamt)  As outstanding
        From dw.claimsummarystats 
        Group By reportperiod,claimnumber
        ) ckpi2
        On ckpi2.reportperiod =  ckpi1.reportperiod and  ckpi2.claimnumber = ckpi1.claimnumber
      ) claimkpi
            On featurekpi.rperiod = claimkpi.report_period 
                    and featurekpi.claim_num = claimkpi.claim_number
  
  
  fields:

  # - dimension: activity_in_month
  #   view_label: 'Claim Status Indicators'
  #   type: string
  #   sql: ${TABLE}.statactivity
  
  - dimension: adjuster
    label: "Adjuster"
    type: string
    sql: ${TABLE}.adjuster
    
  - dimension: adjuster_code
    view_label: 'Claim Organization'
    label: "Adjuster Code"
    type: string
    sql: ${TABLE}.adjuster

  - dimension: adjusterref
    view_label: 'Claim Organization'
    label: 'Adjuster Ref'
    type: number
    sql: ${TABLE}.adjusterref

  - dimension: claimadddt
    label: "Claim Add Date"
    type: date
    sql: ${TABLE}.claimadddt

  - dimension: claimantcode
    label: "Claimant Code"
    type: string
    sql: ${TABLE}.claimantcode
    
  - dimension: claim_closed_date
    description: 'Date Claim was Closed'
    view_label: 'Claim Dates'
    type: date
    sql: ${TABLE}.closeddate
    
  - dimension: claims_days_open
    view_label: 'Claim Counts and Days'
    type: number
    sql: ${TABLE}.daysopen

  - dimension: claim_number
    view_label: 'Claim Details'
    hidden: true
    sql: ${TABLE}.claimnumber
    
  - dimension: claim_open_date
    description: 'Date claim was first entered into the system'
    view_label: 'Claim Dates'
    type: date
    sql: ${TABLE}.claimadddt
    
  - dimension: claim_reopen_date
    description: 'Date claim was reopened'
    view_label: 'Claim Dates'
    type: date
    sql: ${TABLE}.reopendate
    
  - dimension: claimstatus
    label: "Claim Status"
    hidden: true
    type: string
    sql: ${TABLE}.claimstatus
    
  - dimension: claim_status
    description: 'Status of the overall claim'
    view_label: 'Claim Status Indicators'
    type: string
    sql: ${TABLE}.claimstatus

  - dimension: claimstatusactivity
    label: "Claim Status Activity"
    type: string
    sql: ${TABLE}.claimstatusactivity
    
  - dimension: claims_total_days_open
    view_label: 'Claim Counts and Days'
    type: number
    sql: ${TABLE}.totaldaysopen

  - dimension_group: claimupdatedate
    label: 'Claim Update'
    type: time
    timeframes: [date, week, month]
    convert_tz: false
    sql: ${TABLE}.claimupdatedate

  - dimension: closed1000lessitd
    view_label: 'Claim Status Indicators'
    label: "Closed in Month <= 1000 ITD"
    type: string
    sql: ${TABLE}.closed1000lessitd

  - dimension: closed1000lessmtd
    view_label: 'Claim Status Indicators'
    hidden: true
    label: "Closed in Month <= 1000 MTD"
    type: string
    sql: ${TABLE}.closed1000lessmtd

  - dimension: closed1000lessytd
    view_label: 'Claim Status Indicators'
    hidden: true
    label: "Closed in Month <= 1000 YTD"
    type: string
    sql: ${TABLE}.closed1000lessytd

  - dimension: closed500lessitd
    view_label: 'Claim Status Indicators'
    label: "Closed in Month<= 500 ITD"
    type: string
    sql: ${TABLE}.closed500lessitd

  - dimension: closed500lessmtd
    view_label: 'Claim Status Indicators'
    hidden: true
    label: "Closed in Month <= 500 MTD"
    type: string
    sql: ${TABLE}.closed500lessmtd

  - dimension: closed500lessytd
    view_label: 'Claim Status Indicators'
    hidden: true
    label: "Closed in Month <= 500 YTD"
    type: string
    sql: ${TABLE}.closed500lessytd

  - dimension: closed_in_month
    view_label: 'Claim Status Indicators'
    type: string
    sql: ${TABLE}.closedinmonth

  - dimension: closed_in_year
    view_label: 'Claim Status Indicators'
    type: string
    sql: ${TABLE}.closedinyear

  - dimension: closednopayitd
    view_label: 'Claim Status Indicators'
    label: "Closed in Month No Pay ITD"
    type: string
    sql: ${TABLE}.closednopayitd

  - dimension: closednopayitdyearend
    view_label: 'Claim Status Indicators'
    label: "Closed in Year No Pay ITD"
    type: string
    sql: ${TABLE}.closednopayitdyearend

  - dimension: closednopaymtd
    view_label: 'Claim Status Indicators'
    label: "Closed in Month No Pay MTD"
    type: string
    sql: ${TABLE}.closednopaymtd

  - dimension: closednopayytd
    view_label: 'Claim Status Indicators'
    label: "Closed in Month No Pay YTD"
    type: string
    sql: ${TABLE}.closednopayytd

  - dimension: closednopayytdyearend
    view_label: 'Claim Status Indicators'
    label: "Closed in Year No Pay YTD"
    type: string
    sql: ${TABLE}.closednopayytdyearend

  - dimension: days_to_open
    view_label: 'Claim Counts and Days'
    type: number
    sql: ${TABLE}.daystoopen

  - dimension: days_to_report
    view_label: 'Claim Counts and Days'
    type: number
    sql: ${TABLE}.daystoreport

  - dimension: doi_complaint_ind
    view_label: 'Claim Status Indicators'
    type: string
    sql: ${TABLE}.doicomplaintind

  - dimension: exaiminer_code
    view_label: 'Claim Organization'
    type: string
    sql: ${TABLE}.exaiminer

  - dimension: exaiminerref
    view_label: 'Claim Organization'
    label: 'Exaiminer Ref'
    type: number
    sql: ${TABLE}.exaiminerref

  - dimension: featureclosed1000lessitd
    view_label: 'Feature Status Indicators'
    label: 'Feature Closed < 1000 ITD'
    type: string
    sql: ${TABLE}.featureclosed1000lessitd

  - dimension: featureclosed1000lessmtd
    view_label: 'Feature Status Indicators'
    label: 'Feature Closed < 1000 MTD'
    type: string
    sql: ${TABLE}.featureclosed1000lessmtd

  - dimension: featureclosed1000lessytd
    view_label: 'Feature Status Indicators'
    label: 'Feature Closed < 1000 YTD'
    type: string
    sql: ${TABLE}.featureclosed1000lessytd

  - dimension: featureclosed500lessitd
    view_label: 'Feature Status Indicators'
    label: 'Feature Closed < 500 ITD'
    type: string
    sql: ${TABLE}.featureclosed500lessitd

  - dimension: featureclosed500lessmtd
    view_label: 'Feature Status Indicators'
    label: 'Feature Closed < 500 MTD'
    type: string
    sql: ${TABLE}.featureclosed500lessmtd
    
  - dimension: featureclosed500lessytd
    view_label: 'Feature Status Indicators'
    label: 'Feature Closed < 500 YTD'
    type: string
    sql: ${TABLE}.featureclosed500lessytd

  - dimension: feature_closed_date
    view_label: 'Feature Dates'
    type: date
    sql: ${TABLE}.featurecloseddate

  - dimension: feature_closed_in_month
    view_label: 'Feature Status Indicators'
    type: string
    sql: ${TABLE}.featureclosedinmonth

  - dimension: feature_closed_no_pay_itd
    view_label: 'Feature Status Indicators'
    type: string
    sql: ${TABLE}.featureclosednopayitd

  - dimension: feature_closed_no_pay_mtd
    view_label: 'Feature Status Indicators'
    type: string
    sql: ${TABLE}.featureclosednopaymtd

  - dimension: feature_closed_no_pay_ytd
    view_label: 'Feature Status Indicators'
    type: string
    sql: ${TABLE}.featureclosednopayytd
    
  - dimension: featurecode
    hidden: True
    type: string
    sql: ${TABLE}.featurecode

  - dimension: feature_days_open
    view_label: 'Feature Counts and Days'
    type: number
    sql: ${TABLE}.featuredaysopen

  - dimension: feature_open_date
    view_label: 'Feature Dates'
    type: date
    sql: ${TABLE}.featureopendate

  - dimension: feature_opened_in_month
    view_label: 'Feature Status Indicators'
    type: string
    sql: ${TABLE}.featureopenedinmonth

  - dimension: feature_reopen_date
    view_label: 'Feature Dates'
    type: date
#     timeframes: [date, week, month]
#     convert_tz: false
    sql: ${TABLE}.featurereopendate

  - dimension: feature_reopen_in_month
    view_label: 'Feature Status Indicators'
    type: string
    sql: ${TABLE}.featurereopeninmonth

  - dimension: feature_activity
    view_label: 'Feature Status Indicators'
    type: string
    sql: ${TABLE}.featurestatactivity

  - dimension: feature_status
    view_label: 'Feature Status Indicators'
    type: string
    sql: ${TABLE}.featurestatus

  - dimension: feature_total_days_open
    view_label: 'Feature Counts and Days'
    type: number
    sql: ${TABLE}.featuretotaldaysopen

  - dimension_group: featureupdatedate
    label: 'Feature Update'
    type: time
    timeframes: [date, week, month]
    convert_tz: false
    sql: ${TABLE}.featureupdatedate

  - dimension: feature_zero_outstanding
    view_label: 'Feature Status Indicators'
    type: string
    sql: ${TABLE}.featurezerooutstanding

  - dimension: fraud_score
    view_label: 'Fraud Score'
    type: string
    sql: ${TABLE}.fraudscore

  - dimension: fraud_score_description
    view_label: 'Fraud Score'
    type: string
    sql: ${TABLE}.fraudscoredescription

  - dimension: in_siu_ind
    view_label: 'Claim Status Indicators'
    type: string
    sql: ${TABLE}.insiuind
    
  - dimension: itdpaidamt
    type: number
    hidden: true
    sql: ${claim.itdpaidamt}

  - dimension: occurred_in_month
    view_label: 'Claim Status Indicators'
    type: string
    sql: ${TABLE}.occurredinmonth

  - dimension: opened_in_month
    view_label: 'Claim Status Indicators'
    type: string
    sql: ${TABLE}.openedinmonth

  - dimension: opened_in_year
    view_label: 'Claim Status Indicators'
    type: string
    sql: ${TABLE}.openedinyear

  - dimension: reopen_in_month
    view_label: 'Claim Status Indicators'
    type: string
    sql: ${TABLE}.reopeninmonth

  - dimension: reported_by
    description: 'Party that reported the claim'
    type: string
    sql: ${TABLE}.reportedby
    
  - dimension: reported_to
    type: string
    sql: ${TABLE}.reportedto

  - dimension: reported_in_month
    view_label: 'Claim Status Indicators'
    type: string
    sql: ${TABLE}.reportinmonth

  - dimension: reported_in_year
    view_label: 'Claim Status Indicators'
    type: string
    sql: ${TABLE}.reportinyear
    
  - dimension: reportpd
    sql: ${TABLE}.reportpd
    hidden: true 
  
  - dimension_group: report_period
    hidden: true
    view_label: 'Report Dates'
    type: time
    timeframes: [month, year, raw]
    sql: ${TABLE}.reportperiod

  - dimension: short_desc
    view_label: 'Claim Details'
    type: string
    sql: ${TABLE}.shortdesc

  - dimension: suit_filed_ind
    view_label: 'Claim Status Indicators'
    type: string
    sql: ${TABLE}.suitfiledind

  - dimension: zero_outstanding
    view_label: 'Claim Status Indicators'
    type: string
    sql: ${TABLE}.zerooutstanding
    
    ######################################
    #Measures, should all contain a label#
    ######################################
    
  - measure: average_cycle_all_claims 
    view_label: 'Claim Averages'
    description: 'Average number of days since open or reopen date'
    type: avg_distinct
    sql: ${TABLE}.daysopen
    sql_distinct_key: ${TABLE}.claimnumber 
    
  - measure: average_cycle_all_features
    view_label: 'Feature Averages'
    description: 'Average number of days since open or reopen date - Features'
    type: avg_distinct
    sql: ${TABLE}.featuredaysopen
    sql_distinct_key: '${TABLE}.claimnumber || ${TABLE}.claimantcode || ${TABLE}.featurecode'
    
  - measure: average_days_open_feature_not_closed 
    view_label: 'Feature Averages'
    description: 'Average number of days to open for outstanding features'
    type: avg_distinct
    sql: ${TABLE}.featuredaysopen
    sql_distinct_key: '${TABLE}.claimnumber || ${TABLE}.claimantcode || ${TABLE}.featurecode'
    filters:
      feature_status: "Reopen,Reopen-Adjustment,Reopen-Recovery,Open,Open-Adjustment,Open-Recovery"
    
  - measure: average_days_open_not_closed 
    view_label: 'Claim Averages'
    description: 'Average number of days to open for outstanding claims'
    type: avg_distinct
    sql: ${TABLE}.daysopen
    sql_distinct_key: ${TABLE}.claimnumber  
    filters:
      claimstatus: "Reopen,Reopen-Adjustment,Reopen-Recovery,Open,Open-Adjustment,Open-Recovery"
  
  - measure: average_days_to_close 
    view_label: 'Claim Averages'
    description: 'Average number of days to close claim in month'
    type: avg_distinct
    sql: ${TABLE}.daysopen
    sql_distinct_key: ${TABLE}.claimnumber  
    filters:
      claimstatus: "Closed"
      claimstatusactivity: "Yes"

  - measure: average_days_to_close_feature 
    view_label: 'Feature Averages'
    description: 'Average number of days to close feature in month'
    type: avg_distinct
    sql: ${TABLE}.featuredaysopen
    sql_distinct_key: '${TABLE}.claimnumber || ${TABLE}.claimantcode || ${TABLE}.featurecode' 
    filters:
      feature_status: "Closed"
      feature_activity: "Yes"
      
  - measure: average_incurred_loss_itd
    label: 'Average Incurred Loss for Open Claims'
    description: 'Potential severity for Open Claims - (${open_incurred_loss_itd}/NULLIF(${open_claim_count},0)) '
    view_label: 'Claim Averages'
    type: number
    sql: (${open_incurred_loss_itd}/NULLIF(${open_claim_count},0))
      
  - measure: average_outstanding_reserve
    description: 'Average Outstanding Reserve - (${open_outstanding_reserve}/NULLIF(${open_claim_count},0))'
    label: 'Average Reserve for Open Claims'
    view_label: 'Claim Averages'
    type: number
    sql: (${open_outstanding_reserve}/NULLIF(${open_claim_count},0))
    
  - measure: average_paid_loss_itd
    label: 'Closed Claim Severity'
    description: 'Claim Severity for Claims Closed in Month - (${closed_paid_loss_itd}/NULLIF(${closed_claim_count},0))'
    view_label: 'Claim Averages'
    type: number
    sql: (${closed_paid_loss_itd}/NULLIF(${closed_claim_count},0))
    
  - measure: average_total_cycle_all_claims 
    view_label: 'Claim Averages'
    description: 'Average number of days since open date, reopen date not contemplated'
    type: avg_distinct
    sql: ${TABLE}.totaldaysopen
    sql_distinct_key: ${TABLE}.claimnumber
    
  - measure: average_total_cycle_all_features
    view_label: 'Feature Averages'
    description: 'Average number of days since open date, reopen date not contemplated - Feature'
    type: avg_distinct
    sql: ${TABLE}.featuretotaldaysopen
    sql_distinct_key: '${TABLE}.claimnumber || ${TABLE}.claimantcode || ${TABLE}.featurecode'
    
  - measure: claim_occurred_in_month_count
    view_label: 'Claim Counts and Days'
    type: count_distinct
    sql: ${claim_number}
    filters:
      occurred_in_month: "Yes" 
      
  - measure: claims_open_non_zero_reserves_count
    view_label: 'Claim Counts and Days'
    type: count_distinct
    sql: ${claim_number}
    filters:
      claimstatus: "Reopen,Reopen-Adjustment,Reopen-Recovery,Open,Open-Adjustment,Open-Recovery"  
      zero_outstanding: "No"   
      
  - measure: claims_open_with_zero_reserves_count
    view_label: 'Claim Counts and Days'
    type: count_distinct
    sql: ${claim_number}
    filters:
      claimstatus: "Reopen,Reopen-Adjustment,Reopen-Recovery,Open,Open-Adjustment,Open-Recovery"  
      zero_outstanding: "Yes"
      
  - measure: claims_with_activity_count
    view_label: 'Claim Counts and Days'
    type: count_distinct
    sql: ${claim_number}
    filters:
      claimstatusactivity: "Yes"
      
  - measure: closed_claim_count
    label: 'Closed in Month Claim Count'
    view_label: 'Claim Counts and Days'
    type: count_distinct
    sql: ${claim_number}
    filters:
      closed_in_month: "Yes"
      
  - measure: closed_claim_lessthan_500_count
    view_label: 'Claim Counts and Days'
    label: "Closed Claim in Month - Payment <= 500 - Count"
    type: count_distinct
    sql: ${claim_number}
    filters:
      claimstatus: "Closed"
      claimstatusactivity: "Yes"
      closed500lessitd: "Yes"   
    
  - measure: closed_claim_lessthan_1000_count
    view_label: 'Claim Counts and Days'
    label: "Closed Claim in Month - Payment <= 1000 - Count"
    type: count_distinct
    sql: ${claim_number}
    filters:
      claimstatus: "Closed"
      claimstatusactivity: "Yes"
      closed1000lessitd: "Yes" 
      
  - measure: closed_claim_no_pay_count
    label: 'Closed in Month Claim No Pay'
    view_label: 'Claim Counts and Days'
    type: count_distinct
    sql: ${claim_number}
    filters:
      claimstatus: "Closed"
      claimstatusactivity: "Yes"
      closednopayitd: "Yes"
      
  - measure: closed_claim_with_pay_count
    view_label: 'Claim Counts and Days'
    label: 'Closed Claim in Month with Payment Count'
    type: count_distinct
    sql: ${claim_number}
    filters:
      claimstatus: "Closed"
      claimstatusactivity: "Yes"
      closednopayitd: "No" 
      
  - measure: closed_feature_count
    view_label: 'Feature Counts and Days'
    type: count_distinct
    sql: '${TABLE}.claimnumber || ${TABLE}.claimantcode || ${TABLE}.featurecode' 
    filters:
      feature_status: "Closed"
      feature_activity: "Yes"
      
  - measure: closed_feature_lessthan_500_count
    view_label: 'Feature Counts and Days'
    label: "Closed Feature - Payment <= 500 - Count"
    type: count_distinct
    sql: '${TABLE}.claimnumber || ${TABLE}.claimantcode || ${TABLE}.featurecode'
    filters:
      feature_status: "Closed"
      feature_activity: "Yes"
      featureclosed500lessitd: "Yes"   
    
  - measure: closed_feature_lessthan_1000_count
    view_label: 'Feature Counts and Days'
    label: "Closed Feature - Payment <= 1000 - Count"
    type: count_distinct
    sql: '${TABLE}.claimnumber || ${TABLE}.claimantcode || ${TABLE}.featurecode'
    filters:
      feature_status: "Closed"
      feature_activity: "Yes"
      featureclosed1000lessitd: "Yes" 
      
  - measure: closed_feature_no_pay_count
    view_label: 'Feature Counts and Days'
    type: count_distinct
    sql: '${TABLE}.claimnumber || ${TABLE}.claimantcode || ${TABLE}.featurecode'
    filters:
      feature_status: "Closed"
      feature_activity: "Yes"
      feature_closed_no_pay_itd: "Yes"
      
  - measure: closed_feature_paid_loss_itd
    hidden: true
    label: 'Paid Loss ITD for Features Closed in Month'
    description: 'Paid ITD for Features Closed in Month'
    type: sum
    sql: ${itdpaidamt}
    filters:
      feature_closed_in_month: "Yes"
  
  - measure: closed_feature_with_pay_count
    view_label: 'Feature Counts and Days'
    type: count_distinct
    sql: '${TABLE}.claimnumber || ${TABLE}.claimantcode || ${TABLE}.featurecode'
    filters:
      feature_status: "Closed"
      feature_activity: "Yes"
      closednopayitd: "No"
      
  - measure: closed_in_year_claim_count
    view_label: 'Claim Counts and Days'
    type: count_distinct
    sql: ${claim_number}
    filters:
      closed_in_year: "Yes"     
      
  - measure: closed_in_year_claim_no_pay_count
    view_label: 'Claim Counts and Days'
    type: count_distinct
    sql: ${claim_number}
    filters:
      closednopayytdyearend: "Yes"    
      
  - measure: closed_in_year_claim_with_pay_count
    view_label: 'Claim Counts and Days'
    type: count_distinct
    sql: ${claim_number}
    filters:
      closednopayitdyearend: "No"
      
  - measure: closed_paid_loss_itd
    hidden: true
    label: 'Paid Loss ITD for Claims Closed in Month'
    description: 'Paid ITD for Claims Closed in Month'
    type: sum
    sql: ${itdpaidamt}
    filters:
      closed_in_month: "Yes"
    
  - measure: closed_to_open_ratio
    view_label: 'Claim Ratios & Percentages'
    type: number
    sql: ((1.0*(${closed_claim_count}))/NULLIF(${open_claim_count},0)) 
    value_format: '0.00'
    
  - measure: closed_to_opened_ratio
    view_label: 'Claim Ratios & Percentages'
    type: number
    sql: ((1.0*(${closed_claim_count}))/NULLIF((${opened_claim_count})+(${reopened_claim_count}),0)) 
    value_format: '0.00'  
      
  - measure: count_distinct_claim
    view_label: 'Claim Counts and Days'
    label: "Distinct Claim Count"
    type: count_distinct
    sql: ${claim_number}
      
  - measure: count_distinct_feature
    view_label: 'Feature Counts and Days'
    label: "Distinct Feature Count"
    type: count_distinct
    sql:  '${TABLE}.claimnumber || ${TABLE}.claimantcode || ${TABLE}.featurecode'
    
  - measure: feature_average_paid_loss_itd
    label: 'Closed Feature Severity'
    description: 'Claim Severity for Claims Closed in Month - (${closed_feature_paid_loss_itd}/NULLIF(${closed_feature_count},0))'
    view_label: 'Feature Averages'
    type: number
    sql: (${closed_feature_paid_loss_itd}/NULLIF(${closed_feature_count},0))
    
  - measure: feature_closed_to_open_ratio
    view_label: 'Feature Ratios & Percentages'
    type: number
    sql: ((1.0*(${closed_feature_count}))/NULLIF(${open_feature_count},0)) 
    value_format: '0.00'
    
  - measure: feature_closed_to_opened_ratio
    view_label: 'Feature Ratios & Percentages'
    type: number
    sql: ((1.0*(${closed_feature_count}))/NULLIF((${opened_feature_count})+(${reopened_feature_count}),0)) 
    value_format: '0.00'  
      
  - measure: feature_with_activity_count
    view_label: 'Feature Counts and Days'
    type: count_distinct
    sql: '${TABLE}.claimnumber || ${TABLE}.claimantcode || ${TABLE}.featurecode'
    filters:
      feature_activity: "Yes"    
    
  - measure: open_claim_count
    view_label: 'Claim Counts and Days'
    type: count_distinct
    sql: ${claim_number}
    filters:
      claimstatus: "Reopen,Reopen-Adjustment,Reopen-Recovery,Open,Open-Adjustment,Open-Recovery"
      
  - measure: open__claim_with_activity_count
    view_label: 'Claim Counts and Days'
    type: count_distinct
    sql: ${claim_number}
    filters:
      claimstatus: "Reopen,Reopen-Adjustment,Reopen-Recovery,Open,Open-Adjustment,Open-Recovery"
      claimstatusactivity: "Yes"
      
  - measure: open_claim_without_activity_count
    view_label: 'Claim Counts and Days'
    type: number
    sql: ${open_claim_count}-${open__claim_with_activity_count}
    
  - measure: open_claim_with_pay_count
    view_label: 'Claim Counts and Days'
    label: 'Open Claims in Month with Payment Count'
    type: count_distinct
    sql: ${claim_number}
    filters:
      claimstatus: "Open"
      claimstatusactivity: "Yes"
      opened_in_month: "Yes"
      itdpaidamt: ">0"
      claimstatusactivity: "Yes"
    
  - measure: opened_claim_count
    view_label: 'Claim Counts and Days'
    label: 'Opened in Month Claim Count'
    type: count_distinct
    sql: ${claim_number}
    filters:
      opened_in_month: "Yes"
      
  - measure: opened_feature_count
    view_label: 'Feature Counts and Days'
    type: count_distinct
    sql: '${TABLE}.claimnumber || ${TABLE}.claimantcode || ${TABLE}.featurecode'
    filters:
      feature_opened_in_month: "Yes"
      
  - measure: opened_in_year_claim_count
    view_label: 'Claim Counts and Days'
    type: count_distinct
    sql: ${claim_number}
    filters:
      opened_in_year: "Yes"
   
  - measure: open_feature_count
    view_label: 'Feature Counts and Days'
    type: count_distinct
    sql: '${TABLE}.claimnumber || ${TABLE}.claimantcode || ${TABLE}.featurecode'
    filters:
      feature_status: "Reopen,Reopen-Adjustment,Reopen-Recovery,Open,Open-Adjustment,Open-Recovery"

  - measure: open_feature_with_activity_count
    view_label: 'Feature Counts and Days'
    type: count_distinct
    sql: '${TABLE}.claimnumber || ${TABLE}.claimantcode || ${TABLE}.featurecode'
    filters:
      feature_status: "Reopen,Reopen-Adjustment,Reopen-Recovery,Open,Open-Adjustment,Open-Recovery" 
      feature_activity: "Yes"

  - measure: open_feature_without_activity_count
    view_label: 'Feature Counts and Days'
    type: number
    sql: ${open_feature_count}-${open_feature_with_activity_count}
   
  - measure: open_feature_with_zero_reserves_count
    view_label: 'Feature Counts and Days'
    type: count_distinct
    sql: '${TABLE}.claimnumber || ${TABLE}.claimantcode || ${TABLE}.featurecode'
    filters:
      feature_status: "Reopen,Reopen-Adjustment,Reopen-Recovery,Open,Open-Adjustment,Open-Recovery"  
      feature_zero_outstanding: "Yes"
    
  - measure: open_incurred_loss_itd
    hidden: true
    label: 'Incurred Loss for Open Claims'
    description: 'Incurred Loss for Open Claims'
    type: sum
    sql: ${itdincurredamt} 
    filter: 
     claim_status: "Reopen,Reopen-Adjustment,Reopen-Recovery,Open,Open-Adjustment,Open-Recovery" 
     
  - measure: open_outstanding_reserve
    hidden: true
    label: 'Reserve for Open Claims'
    type: sum
    sql: ${outstandingamt} 
    filter: 
     claim_status: "Reopen,Reopen-Adjustment,Reopen-Recovery,Open,Open-Adjustment,Open-Recovery"
     

  - measure: percentage_closed_claims_without_payment
    view_label: 'Claim Ratios & Percentages'
    label: "% Closed - No Pay"
    type: number
    sql: ((1.0*(${closed_claim_no_pay_count}))/NULLIF(${closed_claim_count},0))
    value_format: '0.00%' 
  
  - measure: percentage_closed_claims_with_payment_less_500
    view_label: 'Claim Ratios & Percentages'
    label: "% Closed - Paid <= 500"
    type: number
    sql: ((1.0*(${closed_claim_lessthan_500_count}))/NULLIF(${closed_claim_count},0))
    value_format: '0.00%'    
    
  - measure: percentage_closed_claims_with_payment_less_1000
    view_label: 'Claim Ratios & Percentages'
    label: "% Closed - Paid <= 1000"
    type: number
    sql: ((1.0*(${closed_claim_lessthan_1000_count}))/NULLIF(${closed_claim_count},0))
    value_format: '0.00%' 
    
  - measure: percentage_closed_features_without_payment
    view_label: 'Feature Ratios & Percentages'
    label: "% Closed Features - No Pay"
    type: number
    sql: ((1.0*(${closed_feature_no_pay_count}))/NULLIF(${closed_feature_count},0))
    value_format: '0.00%'   
    
  - measure: percentage_closed_features_with_payment_less_500
    view_label: 'Feature Ratios & Percentages'
    label: "% Closed Features - Paid <= 500"
    type: number
    sql: ((1.0*(${closed_feature_lessthan_500_count}))/NULLIF(${closed_feature_count},0))
    value_format: '0.00%'    
    
  - measure: percentage_closed_features_with_payment_less_1000
    view_label: 'Feature Ratios & Percentages'
    label: "% Closed Features - Paid <= 1000"
    type: number
    sql: ((1.0*(${closed_feature_lessthan_1000_count}))/NULLIF(${closed_feature_count},0))
    value_format: '0.00%' 

  - measure: percentage_open_claims_without_activity
    view_label: 'Claim Ratios & Percentages'
    label: "% Open Without Activity"
    type: number
    sql: ((1.0*(${open_claim_without_activity_count}))/NULLIF(${open_claim_count},0))
    value_format: '0.00%'
    
  - measure: percentage_open_claims_with_zero_reserves
    view_label: 'Claim Ratios & Percentages'
    label: "% Open With No Reserves"
    type: number
    sql: ((1.0*(${claims_open_with_zero_reserves_count}))/NULLIF(${open_claim_count},0))
    value_format: '0.00%'
    
  - measure: percentage_open_features_without_activity
    view_label: 'Feature Ratios & Percentages'
    label: "% Open Features Without Activity"
    type: number
    sql: ((1.0*(${open_feature_without_activity_count}))/NULLIF(${open_feature_count},0))
    value_format: '0.00%'
    
  - measure: percentage_open_features_with_zero_reserves
    view_label: 'Feature Ratios & Percentages'
    label: "% Open Features With No Reserves"
    type: number
    sql: ((1.0*(${open_feature_with_zero_reserves_count}))/NULLIF(${open_feature_count},0))
    value_format: '0.00%'
      
  - measure: reopened_claim_count
    view_label: 'Claim Counts and Days'
    type: count_distinct
    sql: ${claim_number}
    filters:
      claimstatus: "Reopen,Reopen-Adjustment,Reopen-Recovery"  
      claimstatusactivity: "Yes"
      
  - measure: reopened_feature_count
    view_label: 'Feature Counts and Days'
    type: count_distinct
    sql: '${TABLE}.claimnumber || ${TABLE}.claimantcode || ${TABLE}.featurecode'
    filters:
      feature_status: "Reopen,Reopen-Adjustment,Reopen-Recovery"  
      feature_activity: "Yes"
      
  - measure: reported_claim_count
    label: 'Reported in Month Claim Count'
    view_label: 'Claim Counts and Days'
    type: count_distinct
    sql: ${claim_number}
    filters:
      reported_in_month: "Yes"  
      
  - measure: reported_in_year_claim_count
    view_label: 'Claim Counts and Days'
    type: count_distinct
    sql: ${claim_number}
    filters:
      reported_in_year: "Yes"     

  - measure: count
    type: count
    drill_fields: detail*