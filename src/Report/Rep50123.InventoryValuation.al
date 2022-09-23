#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0424, AW0006 // ForNAV settings
//51516123_v6_3_0_2259) { }
// Autogenerated code - do not delete or modify -->

Report 50123 "Inventory Valuation."
{
    Caption = 'Inventory Valuation';
    RDLCLayout = 'Layouts/InventoryValuation..rdlc';
    DefaultLayout = RDLC;

    dataset
    {
        dataitem(Item; Item)
        {
            DataItemTableView = sorting("Inventory Posting Group") where(Type = const(Inventory));
            RequestFilterFields = "No.", "Inventory Posting Group", "Statistics Group";
            column(ReportForNavId_8129; 8129) { } // Autogenerated by ForNav - Do not delete
            column(BoM_Text; BoM_TextLbl)
            {
            }
            column(COMPANYNAME; COMPANYNAME)
            {
            }

            column(STRSUBSTNO___1___2__Item_TABLECAPTION_ItemFilter_; StrSubstNo('%1: %2', TableCaption, ItemFilter))
            {
            }
            column(STRSUBSTNO_Text005_StartDateText_; StrSubstNo(Text005, StartDateText))
            {
            }
            column(STRSUBSTNO_Text005_FORMAT_EndDate__; StrSubstNo(Text005, Format(EndDate)))
            {
            }
            column(ShowExpected; ShowExpected)
            {
            }
            column(ItemFilter; ItemFilter)
            {
            }
            column(Inventory_ValuationCaption; Inventory_ValuationCaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            {
            }
            column(This_report_includes_entries_that_have_been_posted_with_expected_costs_Caption; This_report_includes_entries_that_have_been_posted_with_expected_costs_CaptionLbl)
            {
            }
            column(ItemNoCaption; ValueEntry.FieldCaption("Item No."))
            {
            }
            column(ItemDescriptionCaption; FieldCaption(Description))
            {
            }
            column(IncreaseInvoicedQtyCaption; IncreaseInvoicedQtyCaptionLbl)
            {
            }
            column(DecreaseInvoicedQtyCaption; DecreaseInvoicedQtyCaptionLbl)
            {
            }
            column(QuantityCaption; QuantityCaptionLbl)
            {
            }
            column(ValueCaption; ValueCaptionLbl)
            {
            }
            column(QuantityCaption_Control31; QuantityCaption_Control31Lbl)
            {
            }
            column(QuantityCaption_Control40; QuantityCaption_Control40Lbl)
            {
            }
            column(InvCostPostedToGL_Control53Caption; InvCostPostedToGL_Control53CaptionLbl)
            {
            }
            column(QuantityCaption_Control58; QuantityCaption_Control58Lbl)
            {
            }
            column(TotalCaption; TotalCaptionLbl)
            {
            }
            column(Expected_Cost_IncludedCaption; Expected_Cost_IncludedCaptionLbl)
            {
            }
            column(Expected_Cost_Included_TotalCaption; Expected_Cost_Included_TotalCaptionLbl)
            {
            }
            column(Expected_Cost_TotalCaption; Expected_Cost_TotalCaptionLbl)
            {
            }
            column(GetUrlForReportDrilldown; GetUrlForReportDrilldown("No."))
            {
            }
            column(ItemNo; Item."No.")
            {
            }
            column(ItemDescription; Item.Description)
            {
            }
            column(ItemBaseUnitofMeasure; Item."Base Unit of Measure")
            {
            }
            column(Item_Inventory_Posting_Group; Item."Inventory Posting Group")
            {
            }
            column(StartingInvoicedValue; StartingInvoicedValue)
            {
                AutoFormatType = 1;
            }
            column(StartingInvoicedQty; StartingInvoicedQty)
            {
                DecimalPlaces = 0 : 5;
            }
            column(StartingExpectedValue; StartingExpectedValue)
            {
                AutoFormatType = 1;
            }
            column(StartingExpectedQty; StartingExpectedQty)
            {
                DecimalPlaces = 0 : 5;
            }
            column(IncreaseInvoicedValue; IncreaseInvoicedValue)
            {
                AutoFormatType = 1;
            }
            column(IncreaseInvoicedQty; IncreaseInvoicedQty)
            {
                DecimalPlaces = 0 : 5;
            }
            column(IncreaseExpectedValue; IncreaseExpectedValue)
            {
                AutoFormatType = 1;
            }
            column(IncreaseExpectedQty; IncreaseExpectedQty)
            {
                DecimalPlaces = 0 : 5;
            }
            column(DecreaseInvoicedValue; DecreaseInvoicedValue)
            {
                AutoFormatType = 1;
            }
            column(DecreaseInvoicedQty; DecreaseInvoicedQty)
            {
                DecimalPlaces = 0 : 5;
            }
            column(DecreaseExpectedValue; DecreaseExpectedValue)
            {
                AutoFormatType = 1;
            }
            column(DecreaseExpectedQty; DecreaseExpectedQty)
            {
                DecimalPlaces = 0 : 5;
            }
            column(EndingInvoicedValue; StartingInvoicedValue + IncreaseInvoicedValue - DecreaseInvoicedValue)
            {
            }
            column(EndingInvoicedQty; StartingInvoicedQty + IncreaseInvoicedQty - DecreaseInvoicedQty)
            {
            }
            column(EndingExpectedValue; StartingExpectedValue + IncreaseExpectedValue - DecreaseExpectedValue)
            {
                AutoFormatType = 1;
            }
            column(EndingExpectedQty; StartingExpectedQty + IncreaseExpectedQty - DecreaseExpectedQty)
            {
            }
            column(CostPostedToGL; CostPostedToGL)
            {
                AutoFormatType = 1;
            }
            column(InvCostPostedToGL; InvCostPostedToGL)
            {
                AutoFormatType = 1;
            }
            column(ExpCostPostedToGL; ExpCostPostedToGL)
            {
                AutoFormatType = 1;
            }
            trigger OnPreDataItem();
            begin


            end;

            trigger OnAfterGetRecord();
            begin
                CalcFields("Assembly BOM");
                if EndDate = 0D then
                    EndDate := 99991231D;
                StartingInvoicedValue := 0;
                StartingExpectedValue := 0;
                StartingInvoicedQty := 0;
                StartingExpectedQty := 0;
                IncreaseInvoicedValue := 0;
                IncreaseExpectedValue := 0;
                IncreaseInvoicedQty := 0;
                IncreaseExpectedQty := 0;
                DecreaseInvoicedValue := 0;
                DecreaseExpectedValue := 0;
                DecreaseInvoicedQty := 0;
                DecreaseExpectedQty := 0;
                InvCostPostedToGL := 0;
                CostPostedToGL := 0;
                ExpCostPostedToGL := 0;
                IsEmptyLine := true;
                ValueEntry.Reset;
                ValueEntry.SetRange("Item No.", "No.");
                ValueEntry.SetFilter("Variant Code", GetFilter("Variant Filter"));
                ValueEntry.SetFilter("Location Code", GetFilter("Location Filter"));
                ValueEntry.SetFilter("Global Dimension 1 Code", GetFilter("Global Dimension 1 Filter"));
                ValueEntry.SetFilter("Global Dimension 2 Code", GetFilter("Global Dimension 2 Filter"));
                if StartDate > 0D then begin
                    ValueEntry.SetRange("Posting Date", 0D, CalcDate('<-1D>', StartDate));
                    ValueEntry.CalcSums("Item Ledger Entry Quantity", "Cost Amount (Actual)", "Cost Amount (Expected)", "Invoiced Quantity");
                    AssignAmounts(ValueEntry, StartingInvoicedValue, StartingInvoicedQty, StartingExpectedValue, StartingExpectedQty, 1);
                    IsEmptyLine := IsEmptyLine and ((StartingInvoicedValue = 0) and (StartingInvoicedQty = 0));
                    IsEmptyLine := IsEmptyLine and (ShowExpected and (StartingExpectedValue = 0) and (StartingExpectedQty = 0));
                end;
                ValueEntry.SetRange("Posting Date", StartDate, EndDate);
                ValueEntry.SetFilter(
                  "Item Ledger Entry Type", '%1|%2|%3|%4',
                  ValueEntry."item ledger entry type"::Purchase,
                  ValueEntry."item ledger entry type"::"Positive Adjmt.",
                  ValueEntry."item ledger entry type"::Output,
                  ValueEntry."item ledger entry type"::"Assembly Output");
                ValueEntry.CalcSums("Item Ledger Entry Quantity", "Cost Amount (Actual)", "Cost Amount (Expected)", "Invoiced Quantity");
                AssignAmounts(ValueEntry, IncreaseInvoicedValue, IncreaseInvoicedQty, IncreaseExpectedValue, IncreaseExpectedQty, 1);
                ValueEntry.SetRange("Posting Date", StartDate, EndDate);
                ValueEntry.SetFilter(
                  "Item Ledger Entry Type", '%1|%2|%3|%4',
                  ValueEntry."item ledger entry type"::Sale,
                  ValueEntry."item ledger entry type"::"Negative Adjmt.",
                  ValueEntry."item ledger entry type"::Consumption,
                  ValueEntry."item ledger entry type"::"Assembly Consumption");
                ValueEntry.CalcSums("Item Ledger Entry Quantity", "Cost Amount (Actual)", "Cost Amount (Expected)", "Invoiced Quantity");
                AssignAmounts(ValueEntry, DecreaseInvoicedValue, DecreaseInvoicedQty, DecreaseExpectedValue, DecreaseExpectedQty, -1);
                ValueEntry.SetRange("Posting Date", StartDate, EndDate);
                ValueEntry.SetRange("Item Ledger Entry Type", ValueEntry."item ledger entry type"::Transfer);
                if ValueEntry.FindSet then
                    repeat
                        if true in [ValueEntry."Valued Quantity" < 0, not GetOutboundItemEntry(ValueEntry."Item Ledger Entry No.")] then
                            AssignAmounts(ValueEntry, DecreaseInvoicedValue, DecreaseInvoicedQty, DecreaseExpectedValue, DecreaseExpectedQty, -1)
                        else
                            AssignAmounts(ValueEntry, IncreaseInvoicedValue, IncreaseInvoicedQty, IncreaseExpectedValue, IncreaseExpectedQty, 1);
                    until ValueEntry.Next = 0;
                IsEmptyLine := IsEmptyLine and ((IncreaseInvoicedValue = 0) and (IncreaseInvoicedQty = 0));
                IsEmptyLine := IsEmptyLine and ((DecreaseInvoicedValue = 0) and (DecreaseInvoicedQty = 0));
                IsEmptyLine := IsEmptyLine and (ShowExpected and (IncreaseExpectedValue = 0) and (IncreaseExpectedQty = 0));
                IsEmptyLine := IsEmptyLine and (ShowExpected and (DecreaseExpectedValue = 0) and (DecreaseExpectedQty = 0));
                ValueEntry.SetRange("Posting Date", 0D, EndDate);
                ValueEntry.SetRange("Item Ledger Entry Type");
                ValueEntry.CalcSums("Cost Posted to G/L", "Expected Cost Posted to G/L");
                ExpCostPostedToGL += ValueEntry."Expected Cost Posted to G/L";
                InvCostPostedToGL += ValueEntry."Cost Posted to G/L";
                StartingExpectedValue += StartingInvoicedValue;
                IncreaseExpectedValue += IncreaseInvoicedValue;
                DecreaseExpectedValue += DecreaseInvoicedValue;
                CostPostedToGL := ExpCostPostedToGL + InvCostPostedToGL;
                if IsEmptyLine then
                    CurrReport.Skip;
            end;

        }
    }

    requestpage
    {

        SaveValues = true;

        layout
        {
            area(content)
            {
                group(Options)
                {
                    Caption = 'Options';
                    field(StartingDate; StartDate)
                    {
                        ApplicationArea = Basic;
                        Caption = 'Starting Date';
                    }
                    field(EndingDate; EndDate)
                    {
                        ApplicationArea = Basic;
                        Caption = 'Ending Date';
                    }
                    field(IncludeExpectedCost; ShowExpected)
                    {
                        ApplicationArea = Basic;
                        Caption = 'Include Expected Cost';
                    }

                }
            }
        }

        actions
        {
        }

        trigger OnOpenPage()
        begin
            if (StartDate = 0D) and (EndDate = 0D) then
                EndDate := WorkDate;
            //:= false;
        end;
    }
    labels
    {
        Inventory_Posting_Group_NameCaption = 'Inventory Posting Group Name';
        Expected_CostCaption = 'Expected Cost';
    }

    trigger OnInitReport()
    begin
        ;


    end;

    trigger OnPostReport()
    begin
        ;

    end;

    trigger OnPreReport()
    begin
        if (StartDate = 0D) and (EndDate = 0D) then
            EndDate := WorkDate;
        if StartDate in [0D, 00000101D] then
            StartDateText := ''
        else
            StartDateText := Format(StartDate - 1);
        ItemFilter := Item.GetFilters;
        ;

    end;

    var
        Text005: label 'As of %1';
        ValueEntry: Record "Value Entry";
        StartDate: Date;
        EndDate: Date;
        ShowExpected: Boolean;
        ItemFilter: Text;
        StartDateText: Text[10];
        StartingInvoicedValue: Decimal;
        StartingExpectedValue: Decimal;
        StartingInvoicedQty: Decimal;
        StartingExpectedQty: Decimal;
        IncreaseInvoicedValue: Decimal;
        IncreaseExpectedValue: Decimal;
        IncreaseInvoicedQty: Decimal;
        IncreaseExpectedQty: Decimal;
        DecreaseInvoicedValue: Decimal;
        DecreaseExpectedValue: Decimal;
        DecreaseInvoicedQty: Decimal;
        DecreaseExpectedQty: Decimal;
        BoM_TextLbl: label 'Base UoM';
        Inventory_ValuationCaptionLbl: label 'Inventory Valuation';
        CurrReport_PAGENOCaptionLbl: label 'Page';
        This_report_includes_entries_that_have_been_posted_with_expected_costs_CaptionLbl: label 'This report includes entries that have been posted with expected costs.';
        IncreaseInvoicedQtyCaptionLbl: label 'Increases (LCY)';
        DecreaseInvoicedQtyCaptionLbl: label 'Decreases (LCY)';
        QuantityCaptionLbl: label 'Quantity';
        ValueCaptionLbl: label 'Value';
        QuantityCaption_Control31Lbl: label 'Quantity';
        QuantityCaption_Control40Lbl: label 'Quantity';
        InvCostPostedToGL_Control53CaptionLbl: label 'Cost Posted to G/L';
        QuantityCaption_Control58Lbl: label 'Quantity';
        TotalCaptionLbl: label 'Total';
        Expected_Cost_Included_TotalCaptionLbl: label 'Expected Cost Included Total';
        Expected_Cost_TotalCaptionLbl: label 'Expected Cost Total';
        Expected_Cost_IncludedCaptionLbl: label 'Expected Cost Included';
        InvCostPostedToGL: Decimal;
        CostPostedToGL: Decimal;
        ExpCostPostedToGL: Decimal;
        IsEmptyLine: Boolean;

    local procedure AssignAmounts(ValueEntry: Record "Value Entry"; var InvoicedValue: Decimal; var InvoicedQty: Decimal; var ExpectedValue: Decimal; var ExpectedQty: Decimal; Sign: Decimal)
    begin
        InvoicedValue += ValueEntry."Cost Amount (Actual)" * Sign;
        InvoicedQty += ValueEntry."Invoiced Quantity" * Sign;
        ExpectedValue += ValueEntry."Cost Amount (Expected)" * Sign;
        ExpectedQty += ValueEntry."Item Ledger Entry Quantity" * Sign;
    end;

    local procedure GetOutboundItemEntry(ItemLedgerEntryNo: Integer): Boolean
    var
        ItemApplnEntry: Record "Item Application Entry";
        ItemLedgEntry: Record "Item Ledger Entry";
    begin
        ItemApplnEntry.SetCurrentkey("Item Ledger Entry No.");
        ItemApplnEntry.SetRange("Item Ledger Entry No.", ItemLedgerEntryNo);
        if not ItemApplnEntry.FindFirst then
            exit(true);
        ItemLedgEntry.SetRange("Item No.", Item."No.");
        ItemLedgEntry.SetFilter("Variant Code", Item.GetFilter("Variant Filter"));
        ItemLedgEntry.SetFilter("Location Code", Item.GetFilter("Location Filter"));
        ItemLedgEntry.SetFilter("Global Dimension 1 Code", Item.GetFilter("Global Dimension 1 Filter"));
        ItemLedgEntry.SetFilter("Global Dimension 2 Code", Item.GetFilter("Global Dimension 2 Filter"));
        ItemLedgEntry."Entry No." := ItemApplnEntry."Outbound Item Entry No.";
        exit(not ItemLedgEntry.Find);
    end;

    procedure SetStartDate(DateValue: Date)
    begin
        StartDate := DateValue;
    end;

    procedure SetEndDate(DateValue: Date)
    begin
        EndDate := DateValue;
    end;

    procedure InitializeRequest(NewStartDate: Date; NewEndDate: Date; NewShowExpected: Boolean)
    begin
        StartDate := NewStartDate;
        EndDate := NewEndDate;
        ShowExpected := NewShowExpected;
    end;

    local procedure GetUrlForReportDrilldown(ItemNumber: Code[20]): Text
    begin
        // Generates a URL to the report which sets tab "Item" and field "Field1" on the request page, such as
        // dynamicsnav://hostname:port/instance/company/runreport?report=5801<&Tenant=tenantId>&filter=Item.Field1:1100.
        // TODO
        // Eventually leverage parameters 5 and 6 of GETURL by adding ",Item,TRUE)" and
        // use filter Item.SETFILTER("No.",'=%1',ItemNumber);.
        exit(GetUrl(Clienttype::Current, COMPANYNAME, Objecttype::Report, Report::"Invt. Valuation - Cost Spec.") +
          StrSubstNo('&filter=Item.Field1:%1', ItemNumber));
    end;

    // --> Reports ForNAV Autogenerated code - do not delete or modify
    //51516123_v6_3_0_2259;






    // Reports ForNAV Autogenerated code - do not delete or modify -->
}
