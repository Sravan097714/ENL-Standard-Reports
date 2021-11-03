report 50009 "Check Attachment"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'Reports\Layout\CheckAttachment.rdl';
    UseSystemPrinter = false;
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = all;
    dataset
    {
        dataitem(
            "Cheque Remittance"; "Cheque Remittance")
        {
            DataItemTableView = SORTING(DocNo);
            RequestFilterFields = DocNo;
            column(TODAY; TODAY)
            {
            }
            column(COMPANYNAME; COMPANYNAME)
            {
            }
            column(CurrReport_PAGENO; CurrReport.PAGENO)
            {
            }
            column(USERID; USERID)
            {
            }
            column(CompanyInfo_Picture; CompanyInfo.Picture)
            {
            }
            column(CompanyInfo_Name; CompanyInfo.Name)
            {
            }
            column(CompanyAddr_1_; CompanyArr[1])
            {
            }
            column(CompanyAddr_2_; CompanyArr[2])
            {
            }
            column(CompanyAddr_3_; CompanyArr[3])
            {
            }
            column(CompanyAddr_4_; CompanyArr[4])
            {
            }
            column(CompanyAddr_5_; CompanyArr[5])
            {
            }
            column(CompanyAddr_6_; CompanyArr[6])
            {
            }
            column(CompanyAddr_7_; CompanyArr[7])
            {
            }
            column(CompanyAddr_8_; CompanyArr[8])
            {
            }
            column(CompanyAddr_9_; CompanyArr[9])
            {
            }
            column(CompanyAddr_10_; CompanyArr[10])
            {
            }
            column(PrintDate_; "Cheque Remittance".PrintDate)
            {
            }
            column(DocNo_; "Cheque Remittance".DocNo)
            {
            }
            column(ExtDocNo_; "Cheque Remittance".ExtDocNo)
            {
            }
            column(Date_; "Cheque Remittance".Date)
            {
            }
            column(Details_; "Cheque Remittance".Details)
            {
            }
            column(Amount_; "Cheque Remittance".Amount)
            {
            }
            column(Name_; "Cheque Remittance".Name)
            {
            }
            column(Addr1_; "Cheque Remittance".Addr1)
            {
            }
            column(Addr2_; "Cheque Remittance".Addr2)
            {
            }
            column(City_; "Cheque Remittance".City)
            {
            }
            column(Country_; "Cheque Remittance".Country)
            {
            }
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    labels
    {
    }

    trigger OnPreReport()
    begin

        CompanyInfo.GET;
        CompanyInfo.CALCFIELDS(CompanyInfo.Picture);
        Formataddress.Companys(CompanyArr, CompanyInfo);
    end;

    var
        CompanyInfo: Record 79;
        Formataddress: Codeunit "Format Addresses";
        CompanyArr: array[10] of Text[95];
}

