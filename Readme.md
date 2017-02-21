# Readme

Put your documentation here! Your text is rendered with [GitHub Flavored Markdown](https://help.github.com/articles/github-flavored-markdown).

Click the "Edit" button above to make changes.


## Version History

* 1.0.0 -- Initial version of LookML
* 1.1.0 -- Updated with code from NJUA/WRC
* 1.1.1 -- Updated claims/policy status views to use derived table
* 1.1.2 -- Added the Claim/Policy Level Summary and Claim/Policy Reinsurance Summary views 
* 1.1.3 -- Updated the measures Policy Level Summary and Policy Reinsurance Summary with value_format: "#,##0.00"
* 1.1.4 -- Move reinstateeffectivedtinmonth dimension from Policy Summary to Policy Status in Base
* 1.1.5 -- Correct spelling of "Resereve" in the Reinsurance views
* 1.1.6 -- Make Policy Summary to Status changes of dim/meas due to move of reportpd to derived query.  Add 2 inforce measures to Transaction_Template.Premium
* 1.1.7 -- Change report period dimension to include raw. Replace experience joins to use report period raw instead of reportpd. Add the report_period dimension to experience summary. Remove scoping errors since upgrade.
* 1.1.8 -- Updated fields in the Policy Summary Template and in the Policy Status to include value_format: "#,##0.00" and also to add labels and view labels.
* 1.1.9 -- Updated PolicyLevelSummary Template to use coalesce on ceded amounts in Select stmt. Changed last query table from policyreinsurancesummarystats to policysummarystats. Removed annualstatementlinecd,productname,policytypecd,policygroupcd, and changed providercd to producercd.
* 1.1.10 -- Remove LookML fields not in iic-qa database. BI-979 has word document with removed fields. Change systemid to use number instead of int.
* 1.1.11 -- Added report period month to the Policies Rewewing in 90 Days report, also renamed the inforcechange field name


