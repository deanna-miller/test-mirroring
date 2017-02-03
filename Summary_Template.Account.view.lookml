- view: summary_template_account
  extends: [producer, product, report, coverage, organization]
  fields:

  - dimension: id
    primary_key: true
    sql: ${TABLE}.id
    
     ###########################################
    # Dimensions for Measures should be hidden#
    ###########################################
    
  - dimension: c1balanceamt
    hidden: true
    type: number
    value_format: "#,##0.00"
    sql: ${TABLE}.c1balanceamt

  - dimension: c1mtdadjustmentamt
    hidden: true
    type: number
    value_format: "#,##0.00"
    sql: ${TABLE}.c1mtdadjustmentamt

  - dimension: c1mtdchargeamt
    hidden: true
    type: number
    value_format: "#,##0.00"
    sql: ${TABLE}.c1mtdchargeamt

  - dimension: c1mtdcommissionchargeamt
    hidden: true
    type: number
    value_format: "#,##0.00"
    sql: ${TABLE}.c1mtdcommissionchargeamt

  - dimension: c1mtdpaidamt
    hidden: true
    type: number
    value_format: "#,##0.00"
    sql: ${TABLE}.c1mtdpaidamt

  - dimension: c1payoffbalanceamt
    hidden: true
    type: number
    value_format: "#,##0.00"
    sql: ${TABLE}.c1payoffbalanceamt

  - dimension: c1ttdadjustmentamt
    hidden: true
    type: number
    value_format: "#,##0.00"
    sql: ${TABLE}.c1ttdadjustmentamt

  - dimension: c1ttdchargeamt
    hidden: true
    type: number
    value_format: "#,##0.00"
    sql: ${TABLE}.c1ttdchargeamt

  - dimension: c1ttdcommissionchargeamt
    hidden: true
    type: number
    value_format: "#,##0.00"
    sql: ${TABLE}.c1ttdcommissionchargeamt

  - dimension: c1ttdpaidamt
    hidden: true
    type: number
    value_format: "#,##0.00"
    sql: ${TABLE}.c1ttdpaidamt

  - dimension: c1ytdadjustmentamt
    hidden: true
    type: number
    value_format: "#,##0.00"
    sql: ${TABLE}.c1ytdadjustmentamt

  - dimension: c1ytdchargeamt
    hidden: true
    type: number
    value_format: "#,##0.00"
    sql: ${TABLE}.c1ytdchargeamt

  - dimension: c1ytdcommissionchargeamt
    hidden: true
    type: number
    value_format: "#,##0.00"
    sql: ${TABLE}.c1ytdcommissionchargeamt

  - dimension: c1ytdpaidamt
    hidden: true
    type: number
    value_format: "#,##0.00"
    sql: ${TABLE}.c1ytdpaidamt

  - dimension: c2balanceamt
    hidden: true
    type: number
    value_format: "#,##0.00"
    sql: ${TABLE}.c2balanceamt

  - dimension: c2mtdadjustmentamt
    hidden: true
    type: number
    value_format: "#,##0.00"
    sql: ${TABLE}.c2mtdadjustmentamt

  - dimension: c2mtdchargeamt
    hidden: true
    type: number
    value_format: "#,##0.00"
    sql: ${TABLE}.c2mtdchargeamt

  - dimension: c2mtdcommissionchargeamt
    hidden: true
    type: number
    value_format: "#,##0.00"
    sql: ${TABLE}.c2mtdcommissionchargeamt

  - dimension: c2mtdpaidamt
    hidden: true
    type: number
    value_format: "#,##0.00"
    sql: ${TABLE}.c2mtdpaidamt

  - dimension: c2payoffbalanceamt
    hidden: true
    type: number
    value_format: "#,##0.00"
    sql: ${TABLE}.c2payoffbalanceamt

  - dimension: c2ttdadjustmentamt
    hidden: true
    type: number
    value_format: "#,##0.00"
    sql: ${TABLE}.c2ttdadjustmentamt

  - dimension: c2ttdchargeamt
    hidden: true
    type: number
    value_format: "#,##0.00"
    sql: ${TABLE}.c2ttdchargeamt

  - dimension: c2ttdcommissionchargeamt
    hidden: true
    type: number
    value_format: "#,##0.00"
    sql: ${TABLE}.c2ttdcommissionchargeamt

  - dimension: c2ttdpaidamt
    hidden: true
    type: number
    value_format: "#,##0.00"
    sql: ${TABLE}.c2ttdpaidamt

  - dimension: c2ytdadjustmentamt
    hidden: true
    type: number
    value_format: "#,##0.00"
    sql: ${TABLE}.c2ytdadjustmentamt

  - dimension: c2ytdchargeamt
    hidden: true
    type: number
    value_format: "#,##0.00"
    sql: ${TABLE}.c2ytdchargeamt

  - dimension: c2ytdcommissionchargeamt
    hidden: true
    type: number
    value_format: "#,##0.00"
    sql: ${TABLE}.c2ytdcommissionchargeamt

  - dimension: c2ytdpaidamt
    hidden: true
    type: number
    value_format: "#,##0.00"
    sql: ${TABLE}.c2ytdpaidamt

  - dimension: c3balanceamt
    hidden: true
    type: number
    value_format: "#,##0.00"
    sql: ${TABLE}.c3balanceamt

  - dimension: c3mtdadjustmentamt
    hidden: true
    type: number
    value_format: "#,##0.00"
    sql: ${TABLE}.c3mtdadjustmentamt

  - dimension: c3mtdchargeamt
    hidden: true
    type: number
    value_format: "#,##0.00"
    sql: ${TABLE}.c3mtdchargeamt

  - dimension: c3mtdcommissionchargeamt
    hidden: true
    type: number
    value_format: "#,##0.00"
    sql: ${TABLE}.c3mtdcommissionchargeamt

  - dimension: c3mtdpaidamt
    hidden: true
    type: number
    value_format: "#,##0.00"
    sql: ${TABLE}.c3mtdpaidamt

  - dimension: c3payoffbalanceamt
    hidden: true
    type: number
    value_format: "#,##0.00"
    sql: ${TABLE}.c3payoffbalanceamt

  - dimension: c3ttdadjustmentamt
    hidden: true
    type: number
    value_format: "#,##0.00"
    sql: ${TABLE}.c3ttdadjustmentamt

  - dimension: c3ttdchargeamt
    hidden: true
    type: number
    value_format: "#,##0.00"
    sql: ${TABLE}.c3ttdchargeamt

  - dimension: c3ttdcommissionchargeamt
    hidden: true
    type: number
    value_format: "#,##0.00"
    sql: ${TABLE}.c3ttdcommissionchargeamt

  - dimension: c3ttdpaidamt
    hidden: true
    type: number
    value_format: "#,##0.00"
    sql: ${TABLE}.c3ttdpaidamt

  - dimension: c3ytdadjustmentamt
    hidden: true
    type: number
    value_format: "#,##0.00"
    sql: ${TABLE}.c3ytdadjustmentamt

  - dimension: c3ytdchargeamt
    hidden: true
    type: number
    value_format: "#,##0.00"
    sql: ${TABLE}.c3ytdchargeamt

  - dimension: c3ytdcommissionchargeamt
    hidden: true
    type: number
    value_format: "#,##0.00"
    sql: ${TABLE}.c3ytdcommissionchargeamt

  - dimension: c3ytdpaidamt
    hidden: true
    type: number
    value_format: "#,##0.00"
    sql: ${TABLE}.c3ytdpaidamt

  - dimension: c4balanceamt
    hidden: true
    type: number
    value_format: "#,##0.00"
    sql: ${TABLE}.c4balanceamt

  - dimension: c4mtdadjustmentamt
    hidden: true
    type: number
    value_format: "#,##0.00"
    sql: ${TABLE}.c4mtdadjustmentamt

  - dimension: c4mtdchargeamt
    hidden: true
    type: number
    value_format: "#,##0.00"
    sql: ${TABLE}.c4mtdchargeamt

  - dimension: c4mtdcommissionchargeamt
    hidden: true
    type: number
    value_format: "#,##0.00"
    sql: ${TABLE}.c4mtdcommissionchargeamt

  - dimension: c4mtdpaidamt
    hidden: true
    type: number
    value_format: "#,##0.00"
    sql: ${TABLE}.c4mtdpaidamt

  - dimension: c4payoffbalanceamt
    hidden: true
    type: number
    value_format: "#,##0.00"
    sql: ${TABLE}.c4payoffbalanceamt

  - dimension: c4ttdadjustmentamt
    hidden: true
    type: number
    value_format: "#,##0.00"
    sql: ${TABLE}.c4ttdadjustmentamt

  - dimension: c4ttdchargeamt
    hidden: true
    type: number
    value_format: "#,##0.00"
    sql: ${TABLE}.c4ttdchargeamt

  - dimension: c4ttdcommissionchargeamt
    hidden: true
    type: number
    value_format: "#,##0.00"
    sql: ${TABLE}.c4ttdcommissionchargeamt

  - dimension: c4ttdpaidamt
    hidden: true
    type: number
    value_format: "#,##0.00"
    sql: ${TABLE}.c4ttdpaidamt

  - dimension: c4ytdadjustmentamt
    hidden: true
    type: number
    value_format: "#,##0.00"
    sql: ${TABLE}.c4ytdadjustmentamt

  - dimension: c4ytdchargeamt
    hidden: true
    type: number
    value_format: "#,##0.00"
    sql: ${TABLE}.c4ytdchargeamt

  - dimension: c4ytdcommissionchargeamt
    hidden: true
    type: number
    value_format: "#,##0.00"
    sql: ${TABLE}.c4ytdcommissionchargeamt

  - dimension: c4ytdpaidamt
    hidden: true
    type: number
    value_format: "#,##0.00"
    sql: ${TABLE}.c4ytdpaidamt

  - dimension: cancellationcount
    hidden: true
    type: number
    sql: ${TABLE}.cancellationcount

  - dimension: cancellationnoticecount
    hidden: true
    type: number
    sql: ${TABLE}.cancellationnoticecount

  - dimension: commissionpct
    hidden: true
    type: number
    sql: ${TABLE}.commissionpct
    
  - dimension: futurebalancedueamt
    hidden: true
    type: number
    value_format: "#,##0.00"
    sql: ${TABLE}.futurebalancedueamt

  - dimension: futurebalanceeffectiveamt
    hidden: true
    type: number
    value_format: "#,##0.00"
    sql: ${TABLE}.futurebalanceeffectiveamt

  - dimension: futurechargedueamt
    hidden: true
    type: number
    value_format: "#,##0.00"
    sql: ${TABLE}.futurechargedueamt

  - dimension: futurechargeeffectiveamt
    hidden: true
    type: number
    value_format: "#,##0.00"
    sql: ${TABLE}.futurechargeeffectiveamt

  - dimension: futurepaiddueamt
    hidden: true
    type: number
    value_format: "#,##0.00"
    sql: ${TABLE}.futurepaiddueamt

  - dimension: futurepaideffectiveamt
    hidden: true
    type: number
    value_format: "#,##0.00"
    sql: ${TABLE}.futurepaideffectiveamt
    
  - dimension: latecount
    hidden: true
    type: number
    sql: ${TABLE}.latecount
    
  - dimension: nsfcount
    hidden: true
    type: number
    sql: ${TABLE}.nsfcount

  - dimension: prembalanceamt
    hidden: true
    type: number
    value_format: "#,##0.00"
    sql: ${TABLE}.prembalanceamt

  - dimension: premmtdadjustmentamt
    hidden: true
    type: number
    value_format: "#,##0.00"
    sql: ${TABLE}.premmtdadjustmentamt

  - dimension: premmtdchargeamt
    hidden: true
    type: number
    value_format: "#,##0.00"
    sql: ${TABLE}.premmtdchargeamt

  - dimension: premmtdcommissionchargeamt
    hidden: true
    type: number
    value_format: "#,##0.00"
    sql: ${TABLE}.premmtdcommissionchargeamt

  - dimension: premmtdpaidamt
    hidden: true
    type: number
    value_format: "#,##0.00"
    sql: ${TABLE}.premmtdpaidamt

  - dimension: prempayoffbalanceamt
    hidden: true
    type: number
    value_format: "#,##0.00"
    sql: ${TABLE}.prempayoffbalanceamt

  - dimension: premttdadjustmentamt
    hidden: true
    type: number
    value_format: "#,##0.00"
    sql: ${TABLE}.premttdadjustmentamt

  - dimension: premttdchargeamt
    hidden: true
    type: number
    value_format: "#,##0.00"
    sql: ${TABLE}.premttdchargeamt

  - dimension: premttdcommissionchargeamt
    hidden: true
    type: number
    value_format: "#,##0.00"
    sql: ${TABLE}.premttdcommissionchargeamt

  - dimension: premttdpaidamt
    hidden: true
    type: number
    value_format: "#,##0.00"
    sql: ${TABLE}.premttdpaidamt

  - dimension: premytdadjustmentamt
    hidden: true
    type: number
    value_format: "#,##0.00"
    sql: ${TABLE}.premytdadjustmentamt

  - dimension: premytdchargeamt
    hidden: true
    type: number
    value_format: "#,##0.00"
    sql: ${TABLE}.premytdchargeamt

  - dimension: premytdcommissionchargeamt
    hidden: true
    type: number
    value_format: "#,##0.00"
    sql: ${TABLE}.premytdcommissionchargeamt

  - dimension: premytdpaidamt
    hidden: true
    type: number
    value_format: "#,##0.00"
    sql: ${TABLE}.premytdpaidamt
    
  - dimension: reinstatementcount
    hidden: true
    type: number
    sql: ${TABLE}.reinstatementcount

  - dimension: totalbalanceamt
    hidden: true
    type: number
    value_format: "#,##0.00"
    sql: ${TABLE}.totalbalanceamt
 
  - dimension: totalmtdadjustmentamt
    hidden: true
    type: number
    value_format: "#,##0.00"
    sql: ${TABLE}.totalmtdadjustmentamt

  - dimension: totalmtdchargeamt
    hidden: true
    type: number
    value_format: "#,##0.00"
    sql: ${TABLE}.totalmtdchargeamt

  - dimension: totalmtdcommissionchargeamt
    hidden: true
    type: number
    value_format: "#,##0.00"
    sql: ${TABLE}.totalmtdcommissionchargeamt

  - dimension: totalmtdpaidamt
    hidden: true
    type: number
    value_format: "#,##0.00"
    sql: ${TABLE}.totalmtdpaidamt

  - dimension: totalpayoffbalanceamt
    hidden: true
    type: number
    value_format: "#,##0.00"
    sql: ${TABLE}.totalpayoffbalanceamt

  - dimension: totaltddpaidamt
    hidden: true
    type: number
    value_format: "#,##0.00"
    sql: ${TABLE}.totaltddpaidamt

  - dimension: totalttdadjustmentamt
    hidden: true
    type: number
    value_format: "#,##0.00"
    sql: ${TABLE}.totalttdadjustmentamt

  - dimension: totalttdchargeamt
    hidden: true
    type: number
    value_format: "#,##0.00"
    sql: ${TABLE}.totalttdchargeamt

  - dimension: totalttdcommissionchargeamt
    hidden: true
    type: number
    value_format: "#,##0.00"
    sql: ${TABLE}.totalttdcommissionchargeamt

  - dimension: totalytdadjustmentamt
    hidden: true
    type: number
    value_format: "#,##0.00"
    sql: ${TABLE}.totalytdadjustmentamt

  - dimension: totalytdchargeamt
    hidden: true
    type: number
    value_format: "#,##0.00"
    sql: ${TABLE}.totalytdchargeamt

  - dimension: totalytdcommissionchargeamt
    hidden: true
    type: number
    value_format: "#,##0.00"
    sql: ${TABLE}.totalytdcommissionchargeamt

  - dimension: totalytdpaidamt
    hidden: true
    type: number
    value_format: "#,##0.00"
    sql: ${TABLE}.totalytdpaidamt

    
    #########################################################################
    #Dimensions which are attributes/no measures, should all contain a label#
    #########################################################################

  - dimension: accountnumber
    label: "Account Number"
    sql: ${TABLE}.accountnumber

  - dimension: accountref
    label: "Account Reference"
    sql: ${TABLE}.accountref

  - dimension: accounttypecd
    label: "Account Type"
    sql: ${TABLE}.accounttypecd
 
  - dimension: billingentitysequencenumber
    label: "Billing Entity"
    sql: ${TABLE}.billingentitysequencenumber

  - dimension: billmethod
    label: "Bill Method"
    sql: ${TABLE}.billmethod

  - dimension: commissiontypecd
    label: "Commission Type"
    sql: ${TABLE}.commissiontypecd
    
  - dimension: currentamtduedt
    hidden: true
    type: number
    sql: ${TABLE}.currentamtduedt

  - dimension: currentamteffectivedt
    hidden: true
    type: number
    sql: ${TABLE}.currentamteffectivedt

  - dimension: currentunbilledamtduedt
    hidden: true
    type: number
    sql: ${TABLE}.currentunbilledamtduedt

  - dimension: currentunbilledamteffectivedt
    hidden: true
    type: number
    sql: ${TABLE}.currentunbilledamteffectivedt

  - dimension: depositorylocationcd
    label: "Depository Location"
    sql: ${TABLE}.depositorylocationcd

  - dimension_group: effectivedt
    label: "Effective"
    type: time
    timeframes: [date, week, month]
    convert_tz: false
    sql: ${TABLE}.effectivedt

  - dimension: insuredname
    label: "Insured Name"
    sql: ${TABLE}.insuredname

  - dimension: lessor30amtduedt
    hidden: true
    type: number
    sql: ${TABLE}.lessor30amtduedt

  - dimension: lessor30amteffectivedt
    hidden: true
    type: number
    sql: ${TABLE}.lessor30amteffectivedt

  - dimension_group: nextduedt
    label: "Next Due"
    type: time
    timeframes: [date, week, month]
    convert_tz: false
    sql: ${TABLE}.nextduedt

  - dimension: over30amtduedt
    hidden: true
    type: number
    sql: ${TABLE}.over30amtduedt

  - dimension: over30amteffectivedt
    hidden: true
    type: number
    sql: ${TABLE}.over30amteffectivedt

  - dimension: over60amtduedt
    hidden: true
    type: number
    sql: ${TABLE}.over60amtduedt

  - dimension: over60amteffectivedt
    hidden: true
    type: number
    sql: ${TABLE}.over60amteffectivedt

  - dimension: over90amtduedt
    hidden: true
    type: number
    sql: ${TABLE}.over90amtduedt

  - dimension: over90amteffectivedt
    hidden: true
    type: number
    sql: ${TABLE}.over90amteffectivedt

  - dimension: payplancd
    label: "Pay Plan"
    sql: ${TABLE}.payplancd

  - dimension: policy.policynumber
    label: "Policy Number"
    sql: ${TABLE}.policynumber

  - dimension: policy.policyref
    label: "Policy Reference"
    type: number
    sql: ${TABLE}.policyref

  - dimension: policy.policyversion
    label: "Policy Version"
    sql: ${TABLE}.policyversion

  - dimension: providercd
    label: "Provider"
    sql: ${TABLE}.providercd

  - dimension: statementtypecd
    label: "Statement Type"
    sql: ${TABLE}.statementtypecd

  - dimension: systemid
    hidden: true
    type: int
    sql: ${TABLE}.systemid

#   - dimension_group: updatedt
#     label: "Updated"
#     type: time
#     timeframes: [date, week, month]
#     convert_tz: false
#     sql: ${TABLE}.updatedt
    
  ######################################
  #Measures, should all contain a label#
  ######################################

  - measure: c1_balance_amt
    label: "Category 1 Balance"
    type: sum
    value_format: "#,##0.00"
    sql: ${c1balanceamt}
    
  - measure: c1_mtd_adjustment_amt
    label: "Category 1 MTD Adjustment"
    type: sum
    value_format: "#,##0.00"
    sql: ${c1mtdadjustmentamt}
    
  - measure: c1_mtd_charge_amt
    label: "Category 1 MTD Charge"
    type: sum
    value_format: "#,##0.00"
    sql: ${c1mtdchargeamt}

  - measure: c1_mtd_commission_chargeamt
    label: "Category 1 MTD Commission Charge"
    type: sum
    value_format: "#,##0.00"
    sql: ${c1mtdcommissionchargeamt}
    
  - measure: c1_mtd_paid_amt
    label: "Category 1 MTD Paid"
    type: sum
    value_format: "#,##0.00"
    sql: ${c1mtdpaidamt}  
    
  - measure: c1_payoff_balance_amt
    label: "Category 1 Payoff Balance"
    type: sum
    value_format: "#,##0.00"
    sql: ${c1payoffbalanceamt}  
  
  - measure: c1_ttd_adjustment_amt
    label: "Category 1 TTD Adjustment"
    type: sum
    value_format: "#,##0.00"
    sql: ${c1ttdadjustmentamt}
    
  - measure: c1_ttd_charge_amt
    label: "Category 1 TTD Charge"
    type: sum
    value_format: "#,##0.00"
    sql: ${c1ttdchargeamt}

  - measure: c1_ttd_commission_chargeamt
    label: "Category 1 TTD Commission Charge"
    type: sum
    value_format: "#,##0.00"
    sql: ${c1ttdcommissionchargeamt}
    
  - measure: c1_ttd_paid_amt
    label: "Category 1 TTD Paid"
    type: sum
    value_format: "#,##0.00"
    sql: ${c1ttdpaidamt} 
    
  - measure: c1_ytd_adjustment_amt
    label: "Category 1 YTD Adjustment"
    type: sum
    value_format: "#,##0.00"
    sql: ${c1ytdadjustmentamt}
    
  - measure: c1_ytd_charge_amt
    label: "Category 1 YTD Charge"
    type: sum
    value_format: "#,##0.00"
    sql: ${c1ytdchargeamt}

  - measure: c1_ytd_commission_chargeamt
    label: "Category 1 YTD Commission Charge"
    type: sum
    value_format: "#,##0.00"
    sql: ${c1ytdcommissionchargeamt}
    
  - measure: c1_ytd_paid_amt
    label: "Category 1 YTD Paid"
    type: sum
    value_format: "#,##0.00"
    sql: ${c1ytdpaidamt}  
  
  - measure: c2_balance_amt
    label: "Category 2 Balance"
    type: sum
    value_format: "#,##0.00"
    sql: ${c2balanceamt}
    
  - measure: c2_mtd_adjustment_amt
    label: "Category 2 MTD Adjustment"
    type: sum
    value_format: "#,##0.00"
    sql: ${c2mtdadjustmentamt}
    
  - measure: c2_mtd_charge_amt
    label: "Category 2 MTD Charge"
    type: sum
    value_format: "#,##0.00"
    sql: ${c2mtdchargeamt}

  - measure: c2_mtd_commission_chargeamt
    label: "Category 2 MTD Commission Charge"
    type: sum
    value_format: "#,##0.00"
    sql: ${c2mtdcommissionchargeamt}
    
  - measure: c2_mtd_paid_amt
    label: "Category 2 MTD Paid"
    type: sum
    value_format: "#,##0.00"
    sql: ${c2mtdpaidamt}  
    
  - measure: c2_payoff_balance_amt
    label: "Category 2 Payoff Balance"
    type: sum
    value_format: "#,##0.00"
    sql: ${c2payoffbalanceamt}  
  
  - measure: c2_ttd_adjustment_amt
    label: "Category 2 TTD Adjustment"
    type: sum
    value_format: "#,##0.00"
    sql: ${c2ttdadjustmentamt}
    
  - measure: c2_ttd_charge_amt
    label: "Category 2 TTD Charge"
    type: sum
    value_format: "#,##0.00"
    sql: ${c2ttdchargeamt}

  - measure: c2_ttd_commission_chargeamt
    label: "Category 2 TTD Commission Charge"
    type: sum
    value_format: "#,##0.00"
    sql: ${c2ttdcommissionchargeamt}
    
  - measure: c2_ttd_paid_amt
    label: "Category 2 TTD Paid"
    type: sum
    value_format: "#,##0.00"
    sql: ${c2ttdpaidamt} 
    
  - measure: c2_ytd_adjustment_amt
    label: "Category 2 YTD Adjustment"
    type: sum
    value_format: "#,##0.00"
    sql: ${c2ytdadjustmentamt}
    
  - measure: c2_ytd_charge_amt
    label: "Category 2 YTD Charge"
    type: sum
    value_format: "#,##0.00"
    sql: ${c2ytdchargeamt}

  - measure: c2_ytd_commission_chargeamt
    label: "Category 2 YTD Commission Charge"
    type: sum
    value_format: "#,##0.00"
    sql: ${c2ytdcommissionchargeamt}
    
  - measure: c2_ytd_paid_amt
    label: "Category 2 YTD Paid"
    type: sum
    value_format: "#,##0.00"
    sql: ${c2ytdpaidamt}  
  
  - measure: c3_balance_amt
    label: "Category 3 Balance"
    type: sum
    value_format: "#,##0.00"
    sql: ${c3balanceamt}
    
  - measure: c3_mtd_adjustment_amt
    label: "Category 3 MTD Adjustment"
    type: sum
    value_format: "#,##0.00"
    sql: ${c3mtdadjustmentamt}
    
  - measure: c3_mtd_charge_amt
    label: "Category 3 MTD Charge"
    type: sum
    value_format: "#,##0.00"
    sql: ${c3mtdchargeamt}

  - measure: c3_mtd_commission_chargeamt
    label: "Category 3 MTD Commission Charge"
    type: sum
    value_format: "#,##0.00"
    sql: ${c3mtdcommissionchargeamt}
    
  - measure: c3_mtd_paid_amt
    label: "Category 3 MTD Paid"
    type: sum
    value_format: "#,##0.00"
    sql: ${c3mtdpaidamt}  
    
  - measure: c3_payoff_balance_amt
    label: "Category 3 Payoff Balance"
    type: sum
    value_format: "#,##0.00"
    sql: ${c3payoffbalanceamt}  
  
  - measure: c3_ttd_adjustment_amt
    label: "Category 3 TTD Adjustment"
    type: sum
    value_format: "#,##0.00"
    sql: ${c3ttdadjustmentamt}
    
  - measure: c3_ttd_charge_amt
    label: "Category 3 TTD Charge"
    type: sum
    value_format: "#,##0.00"
    sql: ${c3ttdchargeamt}

  - measure: c3_ttd_commission_chargeamt
    label: "Category 3 TTD Commission Charge"
    type: sum
    value_format: "#,##0.00"
    sql: ${c3ttdcommissionchargeamt}
    
  - measure: c3_ttd_paid_amt
    label: "Category 3 TTD Paid"
    type: sum
    value_format: "#,##0.00"
    sql: ${c3ttdpaidamt} 
    
  - measure: c3_ytd_adjustment_amt
    label: "Category 3 YTD Adjustment"
    type: sum
    value_format: "#,##0.00"
    sql: ${c3ytdadjustmentamt}
    
  - measure: c3_ytd_charge_amt
    label: "Category 3 YTD Charge"
    type: sum
    value_format: "#,##0.00"
    sql: ${c3ytdchargeamt}

  - measure: c3_ytd_commission_chargeamt
    label: "Category 3 YTD Commission Charge"
    type: sum
    value_format: "#,##0.00"
    sql: ${c3ytdcommissionchargeamt}
    
  - measure: c3_ytd_paid_amt
    label: "Category 3 YTD Paid"
    type: sum
    value_format: "#,##0.00"
    sql: ${c3ytdpaidamt} 
    
  - measure: c4_balance_amt
    label: "Category 4 Balance"
    type: sum
    value_format: "#,##0.00"
    sql: ${c4balanceamt}
    
  - measure: c4_mtd_adjustment_amt
    label: "Category 4 MTD Adjustment"
    type: sum
    value_format: "#,##0.00"
    sql: ${c4mtdadjustmentamt}
    
  - measure: c4_mtd_charge_amt
    label: "Category 4 MTD Charge"
    type: sum
    value_format: "#,##0.00"
    sql: ${c4mtdchargeamt}

  - measure: c4_mtd_commission_chargeamt
    label: "Category 4 MTD Commission Charge"
    type: sum
    value_format: "#,##0.00"
    sql: ${c4mtdcommissionchargeamt}
    
  - measure: c4_mtd_paid_amt
    label: "Category 4 MTD Paid"
    type: sum
    value_format: "#,##0.00"
    sql: ${c4mtdpaidamt}  
    
  - measure: c4_payoff_balance_amt
    label: "Category 4 Payoff Balance"
    type: sum
    value_format: "#,##0.00"
    sql: ${c4payoffbalanceamt}  
  
  - measure: c4_ttd_adjustment_amt
    label: "Category 4 TTD Adjustment"
    type: sum
    value_format: "#,##0.00"
    sql: ${c4ttdadjustmentamt}
    
  - measure: c4_ttd_charge_amt
    label: "Category 4 TTD Charge"
    type: sum
    value_format: "#,##0.00"
    sql: ${c4ttdchargeamt}

  - measure: c4_ttd_commission_chargeamt
    label: "Category 4 TTD Commission Charge"
    type: sum
    value_format: "#,##0.00"
    sql: ${c4ttdcommissionchargeamt}
    
  - measure: c4_ttd_paid_amt
    label: "Category 4 TTD Paid"
    type: sum
    value_format: "#,##0.00"
    sql: ${c4ttdpaidamt} 
    
  - measure: c4_ytd_adjustment_amt
    label: "Category 4 YTD Adjustment"
    type: sum
    value_format: "#,##0.00"
    sql: ${c4ytdadjustmentamt}
    
  - measure: c4_ytd_charge_amt
    label: "Category 4 YTD Charge"
    type: sum
    value_format: "#,##0.00"
    sql: ${c4ytdchargeamt}

  - measure: c4_ytd_commission_chargeamt
    label: "Category 4 YTD Commission Charge"
    type: sum
    value_format: "#,##0.00"
    sql: ${c4ytdcommissionchargeamt}
    
  - measure: c4_ytd_paid_amt
    label: "Category 4 YTD Paid"
    type: sum
    value_format: "#,##0.00"
    sql: ${c4ytdpaidamt}  
    
  - measure: cancellation_count
    label: "Cancellation Count"
    type: sum
    value_format: "#,##0.00"
    sql: ${cancellationcount}  
    
  - measure: cancellation_notice_count
    label: "Cancellation Notice Count"
    type: sum
    value_format: "#,##0.00"
    sql: ${cancellationnoticecount}  
    
  - measure: commission_pct
    label: "Commission Pct"
    type: avg
    sql: ${commissionpct}  
    
  - measure: future_balance_due_amt
    label: "Future Balance Due"
    type: sum
    value_format: "#,##0.00"
    sql: ${futurebalancedueamt}  
    
  - measure: future_balance_effective_amt
    label: "Future Balance Effective"
    type: sum
    value_format: "#,##0.00"
    sql: ${futurebalanceeffectiveamt}  
    
  - measure: future_charge_due_amt
    label: "Future Charge Due"
    type: sum
    value_format: "#,##0.00"
    sql: ${futurechargedueamt}  
    
  - measure: future_charge_effective_amt
    label: "Future Charge Effective"
    type: sum
    value_format: "#,##0.00"
    sql: ${futurechargeeffectiveamt}  
    
  - measure: future_paid_due_amt
    label: "Future Paid Due"
    type: sum
    value_format: "#,##0.00"
    sql: ${futurepaiddueamt}  
    
  - measure: future_paid_effective_amt
    label: "Future Paid Effective"
    type: sum
    value_format: "#,##0.00"
    sql: ${futurepaideffectiveamt}  
    
  - measure: late_count
    label: "Late Count"
    type: sum
    sql: ${latecount}  
    
  - measure: nsf_count
    label: "Nsf Count"
    type: sum
    sql: ${nsfcount}  
    
  - measure: prem_balance_amt
    label: "Premium Balance"
    type: sum
    value_format: "#,##0.00"
    sql: ${prembalanceamt} 
    
  - measure: prem_mtd_adjustmentamt
    label: "Premium MTD Adjustment"
    type: sum
    value_format: "#,##0.00"
    sql: ${premmtdadjustmentamt} 
    
  - measure: prem_mtd_charge_amt
    label: "Premium MTD Charge"
    type: sum
    value_format: "#,##0.00"
    sql: ${premmtdchargeamt}
    
  - measure: prem_mtd_commission_charge_amt
    label: "Premium MTD Commission Charge"
    type: sum
    value_format: "#,##0.00"
    sql: ${premmtdcommissionchargeamt} 
    
  - measure: prem_mtd_paid_amt
    label: "Premium MTD Paid"
    type: sum
    value_format: "#,##0.00"
    sql: ${premmtdpaidamt} 
  
  - measure: prem_payoff_balance_amt
    label: "Premium Payoff Balance"
    type: sum
    value_format: "#,##0.00"
    sql: ${prempayoffbalanceamt} 
    
  - measure: prem_ttd_adjustmentamt
    label: "Premium TTD Adjustment"
    type: sum
    value_format: "#,##0.00"
    sql: ${premttdadjustmentamt} 
    
  - measure: prem_ttd_charge_amt
    label: "Premium TTD Charge"
    type: sum
    value_format: "#,##0.00"
    sql: ${premttdchargeamt}
    
  - measure: prem_ttd_commission_charge_amt
    label: "Premium TTD Commission Charge"
    type: sum
    value_format: "#,##0.00"
    sql: ${premttdcommissionchargeamt} 
    
  - measure: prem_ttd_paid_amt
    label: "Premium TTD Paid"
    type: sum
    value_format: "#,##0.00"
    sql: ${premttdpaidamt} 
    
  - measure: prem_ytd_adjustmentamt
    label: "Premium YTD Adjustment"
    type: sum
    value_format: "#,##0.00"
    sql: ${premytdadjustmentamt} 
    
  - measure: prem_ytd_charge_amt
    label: "Premium YTD Charge"
    type: sum
    value_format: "#,##0.00"
    sql: ${premytdchargeamt}
    
  - measure: prem_ytd_commission_charge_amt
    label: "Premium YTD Commission Charge"
    type: sum
    value_format: "#,##0.00"
    sql: ${premytdcommissionchargeamt} 
    
  - measure: prem_ytd_paid_amt
    label: "Premium YTD Paid"
    type: sum
    value_format: "#,##0.00"
    sql: ${premytdpaidamt} 
    
  - measure: reinstatement_count
    label: "Reinstatement Count"
    type: sum
    value_format: "#,##0.00"
    sql: ${reinstatementcount} 
    
  - measure: total_balance_amt
    label: "Total Balance"
    type: sum
    value_format: "#,##0.00"
    sql: ${totalbalanceamt} 
    
  - measure: total_mtd_adjustmentamt
    label: "Total MTD Adjustment"
    type: sum
    value_format: "#,##0.00"
    sql: ${totalmtdadjustmentamt} 
    
  - measure: total_mtd_charge_amt
    label: "Total MTD Charge"
    type: sum
    value_format: "#,##0.00"
    sql: ${totalmtdchargeamt} 
    
  - measure: total_mtd_commission_charge_amt
    label: "Total MTD Commission Charge"
    type: sum
    value_format: "#,##0.00"
    sql: ${totalmtdcommissionchargeamt} 
    
  - measure: total_mtd_paid_amt
    label: "Total MTD Paid"
    type: sum
    value_format: "#,##0.00"
    sql: ${totalmtdpaidamt} 
    
  - measure: total_payoff_balance_amt
    label: "Total Payoff Balance"
    type: sum
    value_format: "#,##0.00"
    sql: ${totalpayoffbalanceamt} 

  - measure: total_ttd_adjustmentamt
    label: "Total TTD Adjustment"
    type: sum
    value_format: "#,##0.00"
    sql: ${totalttdadjustmentamt} 
    
  - measure: total_ttd_charge_amt
    label: "Total TTD Charge"
    type: sum
    value_format: "#,##0.00"
    sql: ${totalttdchargeamt} 
    
  - measure: total_ttd_commission_charge_amt
    label: "Total TTD Commission Charge"
    type: sum
    value_format: "#,##0.00"
    sql: ${totalttdcommissionchargeamt} 
    
  - measure: total_ttd_paid_amt
    label: "Total TTD Paid"
    type: sum
    value_format: "#,##0.00"
    sql: ${totaltddpaidamt} 
    
  - measure: total_ytd_adjustmentamt
    label: "Total YTD Adjustment"
    type: sum
    value_format: "#,##0.00"
    sql: ${totalytdadjustmentamt} 
    
  - measure: total_ytd_charge_amt
    label: "Total YTD Charge"
    type: sum
    value_format: "#,##0.00"
    sql: ${totalytdchargeamt} 
    
  - measure: total_ytd_commission_charge_amt
    label: "Total YTD Commission Charge"
    type: sum
    value_format: "#,##0.00"
    sql: ${totalytdcommissionchargeamt} 
    
  - measure: total_ytd_paid_amt
    label: "Total YTD Paid"
    type: sum
    value_format: "#,##0.00"
    sql: ${totalytdpaidamt} 
    
  - measure: count
    type: count
    drill_fields: [id, insuredname]

