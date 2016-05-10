
SimFile='chChecks_C0.15_Dr0.06_Neff1.1_Rad8.85_end.sp';
ospice_cmd = sprintf('/Users/sanam/OptispiceBin/ospiceResearch %s ',SimFile);
%disp(ospice_cmd);
system(ospice_cmd);
SimFile='chChecks_C0.15_Dr0.06_Neff1.1_Rad8.85_TH_end.sp';
ospice_cmd = sprintf('/Users/sanam/OptispiceBin/ospiceResearch %s ',SimFile);
%disp(ospice_cmd);
system(ospice_cmd);
SimFile='chChecks_C0.15_Dr0.06_Neff1.1_Rad8.85_tri_end.sp';
ospice_cmd = sprintf('/Users/sanam/OptispiceBin/ospiceResearch %s ',SimFile);
%disp(ospice_cmd);
system(ospice_cmd);
chChecks_crosstalkImv;