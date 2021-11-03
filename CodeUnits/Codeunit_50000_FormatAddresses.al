codeunit 50000 "Format Addresses"
{
    // version RCTSB2B1.0


    trigger OnRun()
    begin
    end;

    var


    procedure FormatAddrs(var AddrArray: array[10] of Text[90]; Addr: Text[50]; Addr2: Text[50]; City: Text[50]; Country: Text[30]; Tel: Text[50]; Fax: Text[50]; Email: Text[50]; Homepage: Text[90]; VAT: Text[50]; BRN: Text[50])
    var
        InsertText: Integer;
        Index: Integer;
        AddrLineNo: Integer;
        Addr2LineNo: Integer;
        TelLineNo: Integer;
        PostCodeCityLineNo: Integer;
        FaxLineNo: Integer;
        EmailLineNo: Integer;
        VATLineNo: Integer;
        Dummy: Text[50];
        CountryLineNo: Integer;
        HomepageLineNo: Integer;
        BRNNo: Integer;
    begin
        //001 - SO
        CLEAR(AddrArray);

        AddrLineNo := 1;
        Addr2LineNo := 2;
        PostCodeCityLineNo := 3;
        CountryLineNo := 4;
        TelLineNo := 5;
        FaxLineNo := 6;
        EmailLineNo := 7;
        HomepageLineNo := 8;
        VATLineNo := 9;
        BRNNo := 10;

        AddrArray[AddrLineNo] := Addr;
        AddrArray[Addr2LineNo] := Addr2;
        AddrArray[PostCodeCityLineNo] := City;
        AddrArray[CountryLineNo] := Country;
        AddrArray[TelLineNo] := Tel;
        AddrArray[FaxLineNo] := Fax;
        AddrArray[EmailLineNo] := Email;
        AddrArray[HomepageLineNo] := Homepage;
        AddrArray[VATLineNo] := VAT;
        AddrArray[BRNNo] := BRN;
    end;

    procedure Companys(var AddrArray: array[10] of Text[50]; var CompanyInfo: Record 79)
    var
        Email: Text[50];
        Address2: Text[50];
        Phone: Text[30];
        Fax: Text[30];
        Citys: Text[30];
        Countrys: Text[50];
        Homepage: Text[95];
        Country: Record 9;
        BRN: Text[50];
    begin
        //002 - SO
        WITH CompanyInfo DO BEGIN
            //>>RCTSB2B1.0 20Dec2018
            /*
               IF EISLibrary.CompanyAccessValidation(18) THEN BEGIN
                   IF "E-Mail" <> '' THEN
                       Email := 'Email: ' + "E-Mail"
                   ELSE
                       Email := '';
               END ELSE
               */
            //<<RCTSB2B1.0 20Dec2018
            IF "E-Mail" <> '' THEN
                Email := 'Email: ' + "E-Mail"
            ELSE
                Email := '';

            IF "Phone No." <> '' THEN
                Phone := 'Tel: ' + "Phone No."
            ELSE
                Phone := '';

            IF "Fax No." <> '' THEN
                Fax := 'Fax: ' + "Fax No."
            ELSE
                Fax := '';


            IF "Address 2" <> '' THEN
                Address2 := "Address 2"
            ELSE
                Address2 := '';

            IF City <> '' THEN
                Citys := City + ' ' + "Post Code"
            ELSE
                Citys := '';

            IF "Country/Region Code" <> '' THEN BEGIN
                IF Country.GET("Country/Region Code") THEN
                    Countrys := Country.Name
                ELSE
                    Countrys := '';
            END ELSE
                Countrys := '';

            IF "Home Page" <> '' THEN
                Homepage := ', ' + "Home Page"
            ELSE
                Homepage := '';

            IF "Business Registration No." <> '' THEN
                BRN := ',  ' + 'BRN: ' + CompanyInfo."Business Registration No."
            ELSE
                BRN := '';

            FormatAddrs(
              AddrArray, Address, Address2, Citys, Countrys, Phone, Fax, Email, Homepage, 'VAT Reg. No.: ' + "VAT Registration No.", BRN);
        END;
    end;

    procedure GetCustomer(Rec18Code: Code[20]; var BRNNo: Text[30]; var BRNLabel: Text[30])
    var
        Rec18: Record 18;
    begin
        CLEAR(BRNNo);
        CLEAR(BRNLabel);
        IF Rec18.GET(Rec18Code) THEN BEGIN
            IF Rec18."Business Registraton No." <> '' THEN BEGIN
                BRNNo := Rec18."Business Registraton No.";
                BRNLabel := 'BRN : ';
            END;
        END;
    end;

    procedure GetVendor(VendorCode: Code[20]; var BrnText: Text[30]; var BrnLabel: Text[30])
    var
        Vendor: Record 23;
    begin
        CLEAR(BrnText);
        CLEAR(BrnLabel);
        IF Vendor.GET(VendorCode) THEN BEGIN
            IF Vendor."Business Registraton No." <> '' THEN BEGIN
                BrnText := Vendor."Business Registraton No.";
                BrnLabel := 'BRN : ';
            END;
        END;
    end;

    procedure FormatAddrRCTS(var AddrArray: array[10] of Text[90]; Addr: Text[50]; Addr2: Text[50]; City: Text[50]; Country: Text[30]; Tel: Text[50]; Fax: Text[50]; Email: Text[50]; Homepage: Text[90]; VAT: Text[50]; BRN: Text[50])
    var
        InsertText: Integer;
        Index: Integer;
        AddrLineNo: Integer;
        Addr2LineNo: Integer;
        TelLineNo: Integer;
        PostCodeCityLineNo: Integer;
        FaxLineNo: Integer;
        EmailLineNo: Integer;
        VATLineNo: Integer;
        Dummy: Text[50];
        CountryLineNo: Integer;
        HomepageLineNo: Integer;
        BRNNo: Integer;
    begin
        //001 - SO
        CLEAR(AddrArray);

        AddrLineNo := 1;
        Addr2LineNo := 2;
        PostCodeCityLineNo := 3;
        CountryLineNo := 4;
        TelLineNo := 5;
        FaxLineNo := 6;
        EmailLineNo := 7;
        HomepageLineNo := 8;
        VATLineNo := 9;
        BRNNo := 10;

        AddrArray[AddrLineNo] := Addr;
        AddrArray[Addr2LineNo] := Addr2;
        AddrArray[PostCodeCityLineNo] := City;
        AddrArray[CountryLineNo] := Country;
        AddrArray[TelLineNo] := Tel;
        AddrArray[FaxLineNo] := Fax;
        AddrArray[EmailLineNo] := Email;
        AddrArray[HomepageLineNo] := Homepage;
        AddrArray[VATLineNo] := VAT;
        AddrArray[BRNNo] := BRN;
    end;

    procedure CompanyRCTS(var AddrArray: array[10] of Text[50]; var CompanyInfo: Record 79)
    var
        Email: Text[50];
        Address2: Text[50];
        Phone: Text[30];
        Fax: Text[30];
        Citys: Text[30];
        Countrys: Text[50];
        Homepage: Text[95];
        Country: Record 9;
        BRN: Text[50];
        VATNo: Text[50];
    begin
        WITH CompanyInfo DO BEGIN
            IF "E-Mail" <> '' THEN
                Email := 'Email: ' + "E-Mail"
            ELSE
                Email := '';


            IF "Phone No." <> '' THEN
                Phone := 'Tel: ' + "Phone No."
            ELSE
                Phone := '';

            IF "Fax No." <> '' THEN
                Fax := ', Fax: ' + "Fax No."
            ELSE
                Fax := '';


            IF "Address 2" <> '' THEN
                Address2 := "Address 2"
            ELSE
                Address2 := '';

            IF City <> '' THEN
                Citys := City
            ELSE
                Citys := '';

            IF "Country/Region Code" <> '' THEN BEGIN
                IF Country.GET("Country/Region Code") THEN
                    Countrys := Country.Name
                ELSE
                    Countrys := '';
            END ELSE
                Countrys := '';

            IF "Home Page" <> '' THEN
                Homepage := ', Home Page: ' + "Home Page"
            ELSE
                Homepage := '';

            IF "Business Registration No." <> '' THEN
                BRN := 'BRN: ' + CompanyInfo."Business Registration No."
            ELSE
                BRN := '';


            IF "VAT Registration No." <> '' THEN
                VATNo := 'VAT Reg. No.: ' + "VAT Registration No."
            ELSE
                VATNo := '';

            FormatAddrRCTS(
              AddrArray, Address, Address2, Citys, Countrys, Phone, Fax, Email, Homepage, VATNo, BRN);
        END;
    end;
}

