<?xml version="1.0" encoding="UTF-8"?>
<!-- # Last commit $Id: unified.xsl 38544 2018-02-14 23:05:35Z jkay $ -->

<!--                                                                           -->
<!-- # Copyright (c) 2008-2018, Workbooks Online Limited. All Rights Reserved. -->
<!--                                                                           -->
<!-- Generic Output Document Template - modify as required. We recommend you   -->
<!-- continue to use the configuration tools in the Workbooks Desktop to set   -->
<!-- parameters to your templates - these appear beneath the /hash/text path.  -->
<!--                                                                           -->

<xslt:stylesheet xmlns:date="http://exslt.org/dates-and-times" xmlns:str="http://exslt.org/strings" xmlns:xslt="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:xf="http://www.ecrion.com/xf/1.0" xmlns:xc="http://www.ecrion.com/2008/xc" xmlns:xfd="http://www.ecrion.com/xfd/1.0" xmlns:svg="http://www.w3.org/2000/svg" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" extension-element-prefixes="date str">
  <xslt:output indent="yes" encoding="utf-8"/>

  <xsl:variable name="black" select="'rgb(0,0,0)'"/>
  <xsl:variable name="white" select="'rgb(255,255,255)'"/>

  <xsl:variable name="address" select="/hash/address"/>
  <xsl:variable name="addressTextColour"> <xsl:call-template name="chooseColour"> <xsl:with-param name="colour" select="/hash/text/Address_Text_Colour"/> </xsl:call-template> </xsl:variable>
  <xsl:variable name="assignedToLabel" select="/hash/text/Assigned_To_Label"/>
  <xsl:variable name="assignedToName" select="/hash/assigned_to_name"/>
  <xsl:variable name="bankAccountIBAN" select="/hash/text/Bank_Account_IBAN"/>
  <xsl:variable name="bankAccountIBANLabel" select="/hash/text/Bank_Account_IBAN_Label"/>
  <xsl:variable name="bankAccountName" select="/hash/text/Bank_Account_Name"/>
  <xsl:variable name="bankAccountNameLabel" select="/hash/text/Bank_Account_Name_Label"/>
  <xsl:variable name="bankAccountNumber" select="/hash/text/Bank_Account_Number"/>
  <xsl:variable name="bankAccountNumberLabel" select="/hash/text/Bank_Account_Number_Label"/>
  <xsl:variable name="bankAccountSortCode" select="/hash/text/Bank_Account_Sort_Code"/>
  <xsl:variable name="bankAccountSortCodeLabel" select="/hash/text/Bank_Account_Sort_Code_Label"/>
  <xsl:variable name="bankNameAddress" select="/hash/text/Bank_Name_Address"/>
  <xsl:variable name="bankNameAddressLabel" select="/hash/text/Bank_Name_Address_Label"/>
  <xsl:variable name="collectionClassName" select="/hash/text/Collection_Class_Name"/>
  <xsl:variable name="collectionName" select="/hash/text/Collection_Name"/>
  <xsl:variable name="comment" select="/hash/comment"/>
  <xsl:variable name="commentLabel" select="/hash/text/Comment_Label"/>
  <xsl:variable name="companyNumber" select="/hash/text/Company_Number"/>
  <xsl:variable name="companyNumberLabel" select="/hash/text/Company_Number_Label"/>
  <xsl:variable name="dateFormat" select="/hash/text/Date_Format"/>
  <xsl:variable name="dateLabel" select="/hash/text/Date_Label"/>
  <xsl:variable name="dateSignatureLabel" select="/hash/text/Date_Signature_Label"/>
  <xsl:variable name="deliveryDetails" select="/hash/text/Delivery_Details"/>
  <xsl:variable name="deliveryDetailsLabel" select="/hash/text/Delivery_Details_Label"/>
  <xsl:variable name="description" select="/hash/description"/>
  <xsl:variable name="descriptionLabel" select="/hash/text/Description_Label"/>
  <xsl:variable name="discountLabel" select="/hash/text/Discount_Label"/>
  <xsl:variable name="displayDiscountAs" select="/hash/text/Display_Discount_As"/>
  <xsl:variable name="documentCurrencyCurrencySymbol" select="/hash/document_currency_currency_symbol"/>
  <xsl:variable name="documentCurrencyDiscountedNetValue" select="/hash/document_currency_discounted_net_value"/>
  <xsl:variable name="documentCurrencyGrossValue" select="/hash/document_currency_gross_value"/>
  <xsl:variable name="documentCurrencyNetValue" select="/hash/document_currency_net_value"/>
  <xsl:variable name="documentCurrencySalesTaxValue" select="/hash/document_currency_sales_tax_value"/>
  <xsl:variable name="documentDateIso8601" select="/hash/document_date_iso8601"/>
  <xsl:variable name="documentDateUserFormatted"> <xsl:call-template name="date:format-iso8601-date"> <xsl:with-param name="iso8601-date"> <xsl:value-of select="$documentDateIso8601"/> </xsl:with-param> </xsl:call-template> </xsl:variable>
  <xsl:variable name="documentNumberLabel" select="/hash/text/Document_Number_Label"/>
  <xsl:variable name="email" select="/hash/text/Email"/>
  <xsl:variable name="emailLabel" select="/hash/text/Email_Label"/>
  <xsl:variable name="endDateLabel" select="/hash/text/End_Date_Label"/>
  <xsl:variable name="fao" select="/hash/fao"/>
  <xsl:variable name="faoLabel" select="/hash/text/FAO_Label"/>
  <xsl:variable name="faxNumber" select="/hash/text/Fax_Number"/>
  <xsl:variable name="faxNumberLabel" select="/hash/text/Fax_Number_Label"/>
  <xsl:variable name="headerLogo" select="/hash/images/header_logo"/>
  <xsl:variable name="footerTextColour"> <xsl:call-template name="chooseColour"> <xsl:with-param name="colour" select="/hash/text/Footer_Text_Colour"/> </xsl:call-template> </xsl:variable>
  <xsl:variable name="headerTextColour"> <xsl:call-template name="chooseColour"> <xsl:with-param name="colour" select="/hash/text/Header_Text_Colour"/> </xsl:call-template> </xsl:variable>
  <xsl:variable name="lineTotalLabel" select="/hash/text/Line_Total_Label"/>
  <xsl:variable name="mainTextColour"> <xsl:call-template name="chooseColour"> <xsl:with-param name="colour" select="/hash/text/Main_Text_Colour"/> </xsl:call-template> </xsl:variable>
  <xsl:variable name="orderDetails" select="/hash/text/Order_Details"/>
  <xsl:variable name="orderDetailsLabel" select="/hash/text/Order_Details_Label"/>
  <xsl:variable name="ownOrganisationMainAddress" select="/hash/own_organisation/main_address"/>
  <xsl:variable name="ownOrganisationName" select="/hash/own_organisation/name"/>
  <xsl:variable name="ownOrganisationVatNumber" select="/hash/own_organisation/organisation_vat_number"/>
  <xsl:variable name="pageCountLabel" select="/hash/text/Page_Count_Label"/>
  <xsl:variable name="pageNumberLabel" select="/hash/text/Page_Number_Label"/>
  <xsl:variable name="pageOrientation" select="/hash/text/Page_Orientation"/>
  <xsl:variable name="partyName" select="/hash/party_name"/>
  <xsl:variable name="partyRefcode" select="/hash/party_refcode"/>
  <xsl:variable name="paymentDueDateIso8601" select="/hash/payment_due_date_iso8601"/>
  <xsl:variable name="paymentDueDateUserFormatted"> <xsl:call-template name="date:format-iso8601-date"> <xsl:with-param name="iso8601-date"> <xsl:value-of select="$paymentDueDateIso8601"/> </xsl:with-param> </xsl:call-template> </xsl:variable>
  <xsl:variable name="paymentDueDateLabel" select="/hash/text/Payment_Due_Date_Label"/>
  <xsl:variable name="paymentTerms" select="/hash/text/Payment_Terms"/>
  <xsl:variable name="paymentTermsLabel" select="/hash/text/Payment_Terms_Label"/>
  <xsl:variable name="phoneNumber" select="/hash/text/Phone_Number"/>
  <xsl:variable name="phoneNumberLabel" select="/hash/text/Phone_Number_Label"/>
  <xsl:variable name="positionLabel" select="/hash/text/Position_Label"/>
  <xsl:variable name="printNameLabel" select="/hash/text/Print_Name_Label"/>
  <xsl:variable name="productCodeLabel" select="/hash/text/Product_Code_Label"/>
  <xsl:variable name="quantityLabel" select="/hash/text/Quantity_Label"/>
  <xsl:variable name="refcode" select="/hash/refcode"/>
  <xsl:variable name="referenceLabel" select="/hash/text/Reference_Label"/>
  <xsl:variable name="registeredOffice" select="/hash/text/Registered_Office"/>
  <xsl:variable name="registeredOfficeLabel" select="/hash/text/Registered_Office_Label"/>
  <xsl:variable name="shippingLabel" select="/hash/text/Shipping_Label"/>
  <xsl:variable name="signatureLabel" select="/hash/text/Signature_Label"/>
  <xsl:variable name="someDiscountApplies" select="/hash/some_discount_applies != &quot;&quot;"/>
  <xsl:variable name="startDateLabel" select="/hash/text/Start_Date_Label"/>
  <xsl:variable name="subTotalLabel" select="/hash/text/Sub_Total_Label"/>
  <xsl:variable name="tableBorderColour"> <xsl:call-template name="chooseColour"> <xsl:with-param name="colour" select="/hash/text/Table_Border_Colour"/> </xsl:call-template> </xsl:variable>
  <xsl:variable name="tableHeaderColour"> <xsl:call-template name="chooseColour"> <xsl:with-param name="colour" select="/hash/text/Table_Header_Colour"/> </xsl:call-template> </xsl:variable>
  <xsl:variable name="tableHeaderTextColour"> <xsl:call-template name="chooseColour"> <xsl:with-param name="colour" select="/hash/text/Table_Header_Text_Colour"/> </xsl:call-template> </xsl:variable>
  <xsl:variable name="taxPointDateIso8601" select="/hash/tax_point_date_iso8601"/>
  <xsl:variable name="taxPointDateUserFormatted"> <xsl:call-template name="date:format-iso8601-date"> <xsl:with-param name="iso8601-date"> <xsl:value-of select="$taxPointDateIso8601"/> </xsl:with-param> </xsl:call-template> </xsl:variable>
  <xsl:variable name="taxPointDateLabel" select="/hash/text/Tax_Point_Date_Label"/>
  <xsl:variable name="termsConditions" select="/hash/text/Terms_Conditions"/>
  <xsl:variable name="termsConditionsLabel" select="/hash/text/Terms_Conditions_Label"/>
  <xsl:variable name="title" select="/hash/text/Title"/>
  <xsl:variable name="totalLabel" select="/hash/text/Total_Label"/>
  <xsl:variable name="unitPriceLabel" select="/hash/text/Unit_Price_Label"/>
  <xsl:variable name="vatLabel" select="/hash/text/VAT_Label"/>
  <xsl:variable name="vatNumber" select="/hash/text/VAT_Number"/>
  <xsl:variable name="vatNumberLabel" select="/hash/text/VAT_Number_Label"/>
  <xsl:variable name="website" select="/hash/text/Website"/>
  <xsl:variable name="websiteLabel" select="/hash/text/Website_Label"/>
  <xsl:variable name="yourPOLabel" select="/hash/text/Your_PO_Label"/>
  
  <xsl:variable name="isLandscape" select="$pageOrientation = &quot;Landscape&quot;"/>
  <xsl:variable name="isContract" select="$collectionClassName = &quot;Private::Accounting::Contract&quot;"/>
  <xsl:variable name="isCreditNote" select="$collectionClassName = &quot;Private::Accounting::CreditNote&quot;"/>
  <xsl:variable name="isInvoice" select="$collectionClassName = &quot;Private::Accounting::Invoice&quot;"/>
  <xsl:variable name="isPurchaseOrder" select="$collectionClassName = &quot;Private::Accounting::PurchaseOrder&quot;"/>
  <xsl:variable name="isQuotation" select="$collectionClassName = &quot;Private::Accounting::Quotation&quot;"/>
  <xsl:variable name="isSalesOrder" select="$collectionClassName = &quot;Private::Accounting::SalesOrder&quot;"/>
  
  <xsl:template match="/">
    <fo:root>

      <!-- ==== PAGE LAYOUT - CONTROLLED BY Page_Orientation ==== -->

      <xsl:choose>
        <xsl:when test="$isLandscape">
          <fo:layout-master-set>
            <fo:simple-page-master master-name="Letter Page" page-width="11.7in" page-height="8.3in" margin-top="0px" margin-bottom="0px" margin-right="0px" margin-left="0px">
              <fo:region-body region-name="xsl-region-body" padding-top="0px" padding-bottom="0px" padding-left="0px" padding-right="0px" margin-top="4.250cm" margin-bottom="2.750cm" margin-left="1.8cm" margin-right="1.8cm" border-style="none" border-width="0px" border-color="" background="" background-repeat="no-repeat" background-position-horizontal="0px" background-position-vertical="0px" extent="0px" column-gap="0px" column-count="1" reference-orientation="0"/>
              <fo:region-before region-name="xsl-region-before" display-align="after" extent="3.8cm" padding-top="0px" padding-bottom="0px" padding-left="0px" padding-right="0px" border-style="none" border-width="0px" border-color="" background="" background-repeat="no-repeat" background-position-horizontal="0px" background-position-vertical="0px" reference-orientation="0"/>
              <fo:region-after region-name="xsl-region-after" display-align="before" extent="2.750cm" padding-top="0px" padding-bottom="0px" padding-left="0px" padding-right="0px" border-style="none" border-width="0px" border-color="" background="" background-repeat="no-repeat" background-position-horizontal="0px" background-position-vertical="0px" reference-orientation="0"/>
              <fo:region-start region-name="xsl-region-start" extent="1.8cm" padding-top="0px" padding-bottom="0px" padding-left="0px" padding-right="0px" border-style="none" border-width="0px" border-color="" background="" background-repeat="no-repeat" background-position-horizontal="0px" background-position-vertical="0px" reference-orientation="0"/>
              <fo:region-end region-name="xsl-region-end" extent="1.8cm" padding-top="0px" padding-bottom="0px" padding-left="0px" padding-right="0px" border-style="none" border-width="0px" border-color="" background="" background-repeat="no-repeat" background-position-horizontal="0px" background-position-vertical="0px" reference-orientation="0"/>
            </fo:simple-page-master>
          </fo:layout-master-set>
        </xsl:when>
        <xsl:otherwise>
          <fo:layout-master-set>
            <fo:simple-page-master master-name="Letter Page" page-width="8.3in" page-height="11.7in" margin-top="0px" margin-bottom="0px" margin-right="0px" margin-left="0px">
              <fo:region-body region-name="xsl-region-body" padding-top="0px" padding-bottom="0px" padding-left="0px" padding-right="0px" margin-top="4.250cm" margin-bottom="2.750cm" margin-left="1.8cm" margin-right="1.8cm" border-style="none" border-width="0px" border-color="" background="" background-repeat="no-repeat" background-position-horizontal="0px" background-position-vertical="0px" extent="0px" column-gap="0px" column-count="1" reference-orientation="0"/>
              <fo:region-before region-name="xsl-region-before" display-align="after" extent="3.8cm" padding-top="0px" padding-bottom="0px" padding-left="0px" padding-right="0px" border-style="none" border-width="0px" border-color="" background="" background-repeat="no-repeat" background-position-horizontal="0px" background-position-vertical="0px" reference-orientation="0"/>
              <fo:region-after region-name="xsl-region-after" display-align="before" extent="2.750cm" padding-top="0px" padding-bottom="0px" padding-left="0px" padding-right="0px" border-style="none" border-width="0px" border-color="" background="" background-repeat="no-repeat" background-position-horizontal="0px" background-position-vertical="0px" reference-orientation="0"/>
              <fo:region-start region-name="xsl-region-start" extent="1.8cm" padding-top="0px" padding-bottom="0px" padding-left="0px" padding-right="0px" border-style="none" border-width="0px" border-color="" background="" background-repeat="no-repeat" background-position-horizontal="0px" background-position-vertical="0px" reference-orientation="0"/>
              <fo:region-end region-name="xsl-region-end" extent="1.8cm" padding-top="0px" padding-bottom="0px" padding-left="0px" padding-right="0px" border-style="none" border-width="0px" border-color="" background="" background-repeat="no-repeat" background-position-horizontal="0px" background-position-vertical="0px" reference-orientation="0"/>
            </fo:simple-page-master>
          </fo:layout-master-set>
        </xsl:otherwise>
      </xsl:choose>
      
      <fo:page-sequence master-reference="Letter Page">
        
        <!-- ==== "BEFORE REGION" ==== -->
        
        <fo:static-content flow-name="xsl-region-before" font-size="8pt" font-family="Helvetica">
          <fo:block color="{$addressTextColour}">
            <fo:table table-layout="fixed" width="100%" border-collapse="collapse" keep-with-next="always">
              <fo:table-column column-width="50%" column-number="1"/>
              <fo:table-column column-width="50%" column-number="2"/>
              <fo:table-body>
                <fo:table-row>
                  <fo:table-cell display-align="center">
                    
                    <fo:table table-layout="fixed" width="4cm" border-collapse="collapse">
                      <fo:table-column column-width="2cm" column-number="1"/>
                      <fo:table-column column-number="2"/>
                      <fo:table-body>
                        
                        <fo:table-row>
                          <fo:table-cell number-columns-spanned="2">
                            <fo:block> <fo:inline> <xsl:value-of select="$ownOrganisationName"/> </fo:inline> </fo:block>
                            <xsl:if test="$ownOrganisationMainAddress != &quot;&quot;">
                              <fo:block linefeed-treatment="preserve"> <fo:inline> <xsl:value-of select="$ownOrganisationMainAddress"/> </fo:inline> </fo:block>
                            </xsl:if>
                          </fo:table-cell>
                        </fo:table-row>
                        
                        <xsl:call-template name="labelValueTableRowIfLabelAndValue">
                          <xsl:with-param name="label" select="$phoneNumberLabel"/>
                          <xsl:with-param name="value" select="$phoneNumber"/>
                        </xsl:call-template>

                        <xsl:call-template name="labelValueTableRowIfLabelAndValue">
                          <xsl:with-param name="label" select="$faxNumberLabel"/>
                          <xsl:with-param name="value" select="$faxNumber"/>
                        </xsl:call-template>

                        <xsl:call-template name="labelValueTableRowIfLabelAndValue">
                          <xsl:with-param name="label" select="$emailLabel"/>
                          <xsl:with-param name="value" select="$email"/>
                        </xsl:call-template>

                        <xsl:call-template name="labelValueTableRowIfLabelAndValue">
                          <xsl:with-param name="label" select="$websiteLabel"/>
                          <xsl:with-param name="value" select="$website"/>
                        </xsl:call-template>

                      </fo:table-body>
                    </fo:table>
                  </fo:table-cell>
                  <fo:table-cell display-align="center" text-align="right">
                    <fo:block> <fo:external-graphic src="{$headerLogo}" content-height="2cm"/> </fo:block>
                  </fo:table-cell>
                </fo:table-row>
              </fo:table-body>
            </fo:table>
          </fo:block>
        </fo:static-content>
        
        <!-- ==== "AFTER REGION" - FOOTER ==== -->

        <fo:static-content flow-name="xsl-region-after" font-size="6pt" font-family="Helvetica">
          <fo:block> <fo:inline> &#160; </fo:inline> </fo:block>
          <fo:block color="{$footerTextColour}">
            <fo:block text-align="center" font-weight="bold"> <fo:inline> <xsl:value-of select="$ownOrganisationName"/> </fo:inline> </fo:block>
            
            <xsl:call-template name="labelValueCenteredText">
              <xsl:with-param name="label" select="$registeredOfficeLabel"/>
              <xsl:with-param name="defaultLabel" select="'Registered Office:'"/>
              <xsl:with-param name="value" select="$registeredOffice"/>
            </xsl:call-template>

            <xsl:call-template name="labelValueCenteredText">
              <xsl:with-param name="label" select="$companyNumberLabel"/>
              <xsl:with-param name="defaultLabel" select="'Company Number:'"/>
              <xsl:with-param name="value" select="$companyNumber"/>
            </xsl:call-template>

            <xsl:call-template name="labelValueCenteredText">
              <xsl:with-param name="label" select="$vatNumberLabel"/>
              <xsl:with-param name="defaultLabel" select="'VAT Number:'"/>
              <xsl:with-param name="value" select="$vatNumber"/>
            </xsl:call-template>

            <fo:block text-align="right">
              <xsl:if test="$pageNumberLabel != &quot;&quot;">
                <fo:inline> <xsl:value-of select="$pageNumberLabel"/> &#160; <fo:page-number/> </fo:inline>
              </xsl:if>
              <xsl:if test="$pageCountLabel != &quot;&quot;">
                <fo:inline> &#160; <xsl:value-of select="$pageCountLabel"/> &#160; <fo:page-number-citation ref-id="pageNumberCitation1"/> </fo:inline>
              </xsl:if>
            </fo:block>
          </fo:block>
        </fo:static-content>

        <!-- ==== "START REGION" - UNUSED ==== -->
        
        <fo:static-content flow-name="xsl-region-start" font-size="9pt" font-family="Helvetica">
          <fo:block>&#160;</fo:block>
        </fo:static-content>
        
        <!-- ==== "END REGION" - UNUSED ==== -->

        <fo:static-content flow-name="xsl-region-end" font-size="9pt" font-family="Helvetica">
          <fo:block>&#160;</fo:block>
        </fo:static-content>
        
        <!-- ==== "BODY FLOW" - MAIN CONTENTS ==== -->

        <fo:flow flow-name="xsl-region-body" font-family="Helvetica" color="{$mainTextColour}">
          
          <!-- === TITLE === -->
          
          <fo:block text-align="center" font-size="14pt" font-weight="bold" display-align="center" padding-bottom="0.45cm" color="{$headerTextColour}">
            <fo:inline>
              <xsl:choose>
                <xsl:when test="$title != &quot;&quot;"> <xsl:value-of select="$title"/> </xsl:when>
                <xsl:otherwise> <xsl:value-of select="$collectionName"/> </xsl:otherwise>
              </xsl:choose>
            </fo:inline>
          </fo:block>
          
          <!-- === THIRD-PARTY ADDRESS AND DOCUMENT REFERENCES === -->
          
          <fo:block space-before.optimum="20pt" space-after.optimum="15pt" font-size="9pt">
            <fo:table table-layout="fixed" width="100%" border-collapse="collapse" keep-with-next="always">
              <fo:table-column column-number="1"/>
              <fo:table-column column-width="6cm" column-number="2"/>
              <fo:table-body>
                <fo:table-row>
                  
                  <!-- == THIRD-PARTY ADDRESS == -->

                  <fo:table-cell>
                    <fo:block> <fo:inline> <xsl:value-of select="$partyName"/> </fo:inline> </fo:block>
                    <fo:block linefeed-treatment="preserve"> <fo:inline> <xsl:value-of select="$address"/> </fo:inline> </fo:block>
                  </fo:table-cell>
                  
                  <!-- == DOCUMENT REFERENCES == -->
                  
                  <fo:table-cell>
                    
                    <fo:block text-align="left">
                      <fo:table table-layout="fixed" width="100%" border-collapse="collapse">
                        <fo:table-column column-width="40.000%" column-number="1"/>
                        <fo:table-column column-width="60.000%" column-number="2"/>
                        <fo:table-body>

                          <xsl:call-template name="labelDefaultValueTableRow">
                            <xsl:with-param name="label" select="$documentNumberLabel"/>
                            <xsl:with-param name="defaultLabel" select="'Our Reference'"/>
                            <xsl:with-param name="value" select="$refcode"/>
                          </xsl:call-template>

                          <xsl:call-template name="labelValueTableRowIfLabelAndValue">
                            <xsl:with-param name="label" select="$dateLabel"/>
                            <xsl:with-param name="value" select="$documentDateUserFormatted"/>
                          </xsl:call-template>

                          <xsl:if test="$isCreditNote or $isInvoice">
                            <xsl:call-template name="labelValueTableRowIfLabelAndValue">
                              <xsl:with-param name="label" select="$taxPointDateLabel"/>
                              <xsl:with-param name="value" select="$taxPointDateUserFormatted"/>
                            </xsl:call-template>
                          </xsl:if>

                          <xsl:call-template name="labelValueTableRowIfLabelAndValue">
                            <xsl:with-param name="label" select="$faoLabel"/>
                            <xsl:with-param name="value" select="$fao"/>
                          </xsl:call-template>
                          
                          <xsl:call-template name="labelValueTableRowIfLabelAndValue">
                            <xsl:with-param name="label" select="$assignedToLabel"/>
                            <xsl:with-param name="value" select="$assignedToName"/>
                          </xsl:call-template>

                        </fo:table-body>
                      </fo:table>
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
              </fo:table-body>
            </fo:table>
          </fo:block>
          
          <!-- === THE (ONE-LINE) DESCRIPTION === -->
          <fo:block space-before.optimum="35pt" space-after.optimum="15pt">
            <xsl:if test="$description != &quot;&quot;">
              <fo:block padding-top="0.45cm" font-size="9pt" font-weight="bold" color="{$headerTextColour}">
                <fo:inline> <xsl:value-of select="$description"/> </fo:inline>
              </fo:block>
            </xsl:if>
          </fo:block>
          
          <!-- === THE LINE ITEMS TABLE === -->
          
          <fo:block padding-top="0.45cm" font-size="9pt" padding-bottom="0cm">
            <fo:table table-layout="fixed" width="100%" border-collapse="collapse" border-color="$tableBorderColour">
              <xsl:choose>
                <xsl:when test="$isContract">
                  <xsl:choose>
                    <xsl:when test="$isLandscape">
                      <fo:table-column column-number="1" column-width="8%"/>
                      <fo:table-column column-number="2" column-width="60%"/>
                      <fo:table-column column-number="3" column-width="8%"/>
                      <fo:table-column column-number="4" column-width="8%"/>
                      <fo:table-column column-number="5" column-width="8%"/>
                      <fo:table-column column-number="6" column-width="8%"/>
                    </xsl:when>
                    <xsl:otherwise>
                      <fo:table-column column-number="1" column-width="10%"/>
                      <fo:table-column column-number="2" column-width="42%"/>
                      <fo:table-column column-number="3" column-width="12%"/>
                      <fo:table-column column-number="4" column-width="12%"/>
                      <fo:table-column column-number="5" column-width="12%"/>
                      <fo:table-column column-number="6" column-width="12%"/>
                    </xsl:otherwise>
                  </xsl:choose>
                </xsl:when>
                <xsl:when test="$isPurchaseOrder or not($someDiscountApplies)">
                  <xsl:choose>
                    <xsl:when test="$isLandscape">
                      <fo:table-column column-number="1" column-width="8%"/>
                      <fo:table-column column-number="2" column-width="20%"/>
                      <fo:table-column column-number="3" column-width="56%"/>
                      <fo:table-column column-number="4" column-width="8%"/>
                      <fo:table-column column-number="5" column-width="8%"/>
                    </xsl:when>
                    <xsl:otherwise>
                      <fo:table-column column-number="1" column-width="10%"/>
                      <fo:table-column column-number="2" column-width="20%"/>
                      <fo:table-column column-number="3" column-width="46%"/>
                      <fo:table-column column-number="4" column-width="12%"/>
                      <fo:table-column column-number="5" column-width="12%"/>
                    </xsl:otherwise>
                  </xsl:choose>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:choose>
                    <xsl:when test="$isLandscape">
                      <fo:table-column column-number="1" column-width="8%"/>
                      <fo:table-column column-number="2" column-width="15%"/>
                      <fo:table-column column-number="3" column-width="53%"/>
                      <fo:table-column column-number="4" column-width="8%"/>
                      <fo:table-column column-number="5" column-width="8%"/>
                      <fo:table-column column-number="6" column-width="8%"/>
                    </xsl:when>
                    <xsl:otherwise>
                      <fo:table-column column-number="1" column-width="10%"/>
                      <fo:table-column column-number="2" column-width="22%"/>
                      <fo:table-column column-number="3" column-width="32%"/>
                      <fo:table-column column-number="4" column-width="12%"/>
                      <fo:table-column column-number="5" column-width="12%"/>
                      <fo:table-column column-number="6" column-width="12%"/>
                    </xsl:otherwise>
                  </xsl:choose>
                </xsl:otherwise>
              </xsl:choose>
              
              <!-- == COLUMN HEADINGS == -->

              <fo:table-header>
                <fo:table-row background-color="{$tableBorderColour}">

                  <xsl:call-template name="tableHeaderCell">
                    <xsl:with-param name="label" select="$quantityLabel"/>
                    <xsl:with-param name="defaultLabel" select="'Quantity'"/>
                    <xsl:with-param name="textAlign" select="'right'"/>
                  </xsl:call-template>

                  <xsl:if test="not($isContract)">
                    <xsl:call-template name="tableHeaderCell">
                      <xsl:with-param name="label" select="$productCodeLabel"/>
                      <xsl:with-param name="defaultLabel" select="'Product Code'"/>
                      <xsl:with-param name="textAlign" select="'left'"/>
                    </xsl:call-template>
                  </xsl:if>

                  <xsl:call-template name="tableHeaderCell">
                    <xsl:with-param name="label" select="$descriptionLabel"/>
                    <xsl:with-param name="defaultLabel" select="'Description'"/>
                    <xsl:with-param name="textAlign" select="'left'"/>
                  </xsl:call-template>

                  <xsl:if test="$isContract">
                    <xsl:call-template name="tableHeaderCell">
                      <xsl:with-param name="label" select="$startDateLabel"/>
                      <xsl:with-param name="defaultLabel" select="'Start Date'"/>
                      <xsl:with-param name="textAlign" select="'right'"/>
                    </xsl:call-template>
                  </xsl:if>

                  <xsl:if test="$isContract">
                    <xsl:call-template name="tableHeaderCell">
                      <xsl:with-param name="label" select="$endDateLabel"/>
                      <xsl:with-param name="defaultLabel" select="'End Date'"/>
                      <xsl:with-param name="textAlign" select="'right'"/>
                    </xsl:call-template>
                  </xsl:if>

                  <xsl:call-template name="tableHeaderCell">
                    <xsl:with-param name="label" select="$unitPriceLabel"/>
                    <xsl:with-param name="defaultLabel" select="'Unit Price'"/>
                    <xsl:with-param name="textAlign" select="'right'"/>
                  </xsl:call-template>
                  
                  <xsl:if test="$someDiscountApplies and not($isContract) and not(isPurchaseOrder)">
                    <xsl:call-template name="tableHeaderCell">
                      <xsl:with-param name="label" select="$discountLabel"/>
                      <xsl:with-param name="defaultLabel" select="'Discount'"/>
                      <xsl:with-param name="textAlign" select="'right'"/>
                    </xsl:call-template>
                  </xsl:if>

                  <xsl:call-template name="tableHeaderCell">
                    <xsl:with-param name="label" select="$lineTotalLabel"/>
                    <xsl:with-param name="defaultLabel" select="'Line Total'"/>
                    <xsl:with-param name="textAlign" select="'right'"/>
                  </xsl:call-template>

                </fo:table-row>
              </fo:table-header>

              <fo:table-body>

                <!-- == LINE ITEMS (SHIPPING ITEMS OMITTED) == -->

                <xsl:for-each select="/hash/order_line_items/order_line_item[contains(./_preload_product_id, 'SHIPPING')=false()]">
                  <fo:table-row>
                    
                    <xsl:call-template name="tableBodyCell">
                      <xsl:with-param name="value" select="unit_quantity"/>
                      <xsl:with-param name="textAlign" select="'right'"/>
                    </xsl:call-template>

                    <xsl:if test="not($isContract)">
                      <xsl:call-template name="tableBodyCell">
                        <xsl:with-param name="value" select="substring-before(_preload_product_id, &quot; - &quot;)"/>
                        <xsl:with-param name="textAlign" select="'left'"/>
                      </xsl:call-template>
                    </xsl:if>

                    <xsl:call-template name="tableBodyCell">
                      <xsl:with-param name="value" select="description"/>
                      <xsl:with-param name="textAlign" select="'left'"/>
                    </xsl:call-template>

                    <xsl:if test="$isContract">
                      <xsl:variable name="startDateUserFormatted"> <xsl:call-template name="date:format-iso8601-date"> <xsl:with-param name="iso8601-date"> <xsl:value-of select="start_date"/> </xsl:with-param> </xsl:call-template> </xsl:variable>
                      <xsl:call-template name="tableBodyCell">
                        <xsl:with-param name="value" select="$startDateUserFormatted"/>
                        <xsl:with-param name="textAlign" select="'right'"/>
                      </xsl:call-template>
                    </xsl:if>

                    <xsl:if test="$isContract">
                      <xsl:variable name="endDateUserFormatted"> <xsl:call-template name="date:format-iso8601-date"> <xsl:with-param name="iso8601-date"> <xsl:value-of select="end_date"/> </xsl:with-param> </xsl:call-template> </xsl:variable>
                      <xsl:call-template name="tableBodyCell">
                        <xsl:with-param name="value" select="$endDateUserFormatted"/>
                        <xsl:with-param name="textAlign" select="'right'"/>
                      </xsl:call-template>
                    </xsl:if>

                    <xsl:call-template name="tableBodyCell">
                      <xsl:with-param name="value">
                        <xsl:choose>
                          <xsl:when test="$isPurchaseOrder"> <xsl:value-of select="document_currency_unit_cost"/> </xsl:when>
                          <xsl:otherwise> <xsl:value-of select="document_currency_unit_price_value"/> </xsl:otherwise>
                        </xsl:choose>
                      </xsl:with-param>
                      <xsl:with-param name="textAlign" select="'right'"/>
                    </xsl:call-template>

                    <xsl:if test="$someDiscountApplies and not($isContract) and not($isPurchaseOrder)">
                      <xsl:call-template name="tableBodyCell">
                        <xsl:with-param name="value">
                          <xsl:choose>
                            <xsl:when test="$displayDiscountAs = &quot;Percentage&quot;"> <xsl:value-of select="discount_percent"/>% </xsl:when>
                            <xsl:otherwise>
                              <xsl:choose>
                                <xsl:when test="(document_currency_unit_price_value/@amount - document_currency_unit_price_after_discount_value/@amount) &gt; 0">
                                  <xsl:value-of select="$documentCurrencyCurrencySymbol"/>
                                  <xsl:if test="(document_currency_unit_price_value/@amount - document_currency_unit_price_after_discount_value/@amount)">
                                    <xsl:value-of select="format-number((document_currency_unit_price_value/@amount - document_currency_unit_price_after_discount_value/@amount), &quot;##,##0.00&quot;, &quot;id1352499&quot;)"/>
                                  </xsl:if>
                                </xsl:when>
                                <xsl:otherwise> <xsl:value-of select="$documentCurrencyCurrencySymbol"/>0.00 </xsl:otherwise>
                              </xsl:choose>
                            </xsl:otherwise>
                          </xsl:choose>
                        </xsl:with-param>
                        <xsl:with-param name="textAlign" select="'right'"/>
                      </xsl:call-template>
                    </xsl:if>

                    <xsl:call-template name="tableBodyCell">
                      <xsl:with-param name="value" select="document_currency_net_value"/>
                      <xsl:with-param name="textAlign" select="'right'"/>
                    </xsl:call-template>

                  </fo:table-row>
                </xsl:for-each>
                
              </fo:table-body>
            </fo:table>
          </fo:block>

          <!--- == TOTALS ARE SHOWN IN A SEPARATE TABLE SO THEY GROUP ON PAGE-BREAK === -->

          <fo:block padding-top="0cm" font-size="9pt" padding-bottom="0.45cm">
            <fo:table table-layout="fixed" width="100%" border-collapse="collapse" color="{$tableHeaderTextColour}" border-color="{$tableBorderColour}">
              <xsl:choose>
                <xsl:when test="$isLandscape">
                  <fo:table-column column-number="1" column-width="92%"/>
                  <fo:table-column column-number="2" column-width="8%"/>
                </xsl:when>
                <xsl:otherwise>
                  <fo:table-column column-number="1" column-width="88%"/>
                  <fo:table-column column-number="2" column-width="12%"/>
                </xsl:otherwise>
              </xsl:choose>
              
              <fo:table-body color="{$headerTextColour}">

                <!-- == SUB-TOTAL, OMITTED IF THERE IS NO Sub_Total_Label == -->

                <xsl:if test="not($isCreditNote) and $subTotalLabel != &quot;&quot; and $ownOrganisationVatNumber != &quot;&quot;">
                  <fo:table-row keep-with-next="always">
                    <fo:table-cell border-width="1pt" border-style="hidden" padding="2pt" text-align="left" border-right-style="solid" border-color="{$tableBorderColour}">
                      <fo:block text-align="right" font-weight="bold" color="{$headerTextColour}"> <xsl:value-of select="$subTotalLabel"/> </fo:block>
                    </fo:table-cell>

                    <fo:table-cell border-width="1pt" border-style="solid" padding="2pt" text-align="right" border-color="{$tableBorderColour}">
                      <fo:block text-align="right" font-size="8pt">
                        <fo:inline> <xsl:value-of select="$documentCurrencyCurrencySymbol"/> </fo:inline>
                        <fo:inline>
                          <xsl:if test="/hash/document_currency_discounted_net_value/@amount - sum(/hash/order_line_items/*/document_currency_unit_price_after_discount_value[contains(../_preload_product_id, 'SHIPPING')=true()]/@amount)">
                            <xsl:value-of select="format-number(/hash/document_currency_discounted_net_value/@amount - sum(/hash/order_line_items/*/document_currency_unit_price_after_discount_value[contains(../_preload_product_id, 'SHIPPING')=true()]/@amount), &quot;#,###.00&quot;, &quot;id1334875&quot;)"/>
                          </xsl:if>
                        </fo:inline>
                      </fo:block>
                    </fo:table-cell>
                  </fo:table-row>
                </xsl:if>

                <!-- == SHIPPING, OMITTED IF THERE IS NO Shipping_Label == -->
                
                <xsl:if test="$shippingLabel != &quot;&quot;">
                  <xsl:for-each select="/hash/order_line_items/order_line_item[contains(./_preload_product_id, 'SHIPPING')=true()]">
                    <fo:table-row keep-with-next="always">
                      <fo:table-cell border-width="1pt" border-style="hidden" padding="2pt" text-align="left" border-right-style="solid" border-color="{$tableBorderColour}">
                        <fo:block text-align="right" font-weight="bold" color="{$headerTextColour}"> <xsl:value-of select="$shippingLabel"/> </fo:block>
                      </fo:table-cell>
                      
                      <fo:table-cell border-width="1pt" border-style="solid" padding="2pt" text-align="right" border-color="{$tableBorderColour}">
                        <fo:block text-align="right" font-size="8pt">
                          <fo:inline>
                            <xsl:choose>
                              <xsl:when test="sum(/hash/order_line_items/*/document_currency_unit_price_after_discount_value[contains(../_preload_product_id, 'SHIPPING')=true()]/@amount) &gt; 0">
                                <xsl:value-of select="$documentCurrencyCurrencySymbol"/>
                                <xsl:if test="sum(/hash/order_line_items/*/document_currency_unit_price_after_discount_value[contains(../_preload_product_id, 'SHIPPING')=true()]/@amount)">
                                  <xsl:value-of select="format-number(sum(/hash/order_line_items/*/document_currency_unit_price_after_discount_value[contains(../_preload_product_id, 'SHIPPING')=true()]/@amount), &quot;##,##0.00&quot;, &quot;id1406054&quot;)"/>
                                </xsl:if>
                              </xsl:when>
                              <xsl:otherwise> <xsl:value-of select="$documentCurrencyCurrencySymbol"/>0.00 </xsl:otherwise>
                            </xsl:choose>
                          </fo:inline>
                        </fo:block>
                      </fo:table-cell>
                    </fo:table-row>
                  </xsl:for-each>
                </xsl:if>
                
                <!-- == SALES TAX, OMITTED IF THERE IS NO VAT_Label OR NO SALES TAX == -->
                
                <xsl:if test="$vatLabel != &quot;&quot; and $ownOrganisationVatNumber != &quot;&quot;">
                  <xsl:for-each select="/hash/document_currency_sales_tax_value[@amount &gt; 0]">
                    <fo:table-row keep-with-next="always">
                      <fo:table-cell border-width="1pt" border-style="hidden" padding="2pt" text-align="left" border-right-style="solid" border-color="{$tableBorderColour}">
                        <fo:block text-align="right" font-weight="bold" color="{$headerTextColour}"> <xsl:value-of select="$vatLabel"/> </fo:block>
                      </fo:table-cell>
                      
                      <fo:table-cell border-width="1pt" border-style="solid" padding="2pt" text-align="right" border-color="{$tableBorderColour}">
                        <fo:block text-align="right" font-size="8pt"> <fo:inline> <xsl:value-of select="$documentCurrencySalesTaxValue"/> </fo:inline> </fo:block>
                      </fo:table-cell>
                    </fo:table-row>
                  </xsl:for-each>
                </xsl:if>
                
                <!-- == TOTAL == -->
                
                <fo:table-row>
                  <fo:table-cell border-width="1pt" border-style="hidden" padding="2pt" text-align="left" border-right-style="solid" border-color="{$tableBorderColour}">
                    <fo:block text-align="right" font-weight="bold" color="{$headerTextColour}"> <xsl:value-of select="$totalLabel"/> </fo:block>
                  </fo:table-cell>
                  
                  <fo:table-cell border-width="1pt" border-style="solid" padding="2pt" text-align="right" border-color="{$tableBorderColour}">
                    <fo:block text-align="right" font-size="8pt">
                      <fo:inline>
                        <xsl:choose>
                          <xsl:when test="$ownOrganisationVatNumber != &quot;&quot;"> <xsl:value-of select="$documentCurrencyGrossValue"/> </xsl:when>
                          <xsl:otherwise> <xsl:value-of select="$documentCurrencyNetValue"/> </xsl:otherwise>
                        </xsl:choose>
                      </fo:inline>
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>

             </fo:table-body>
            </fo:table>
          </fo:block>
          
          <!-- === NOTES (COMMENTS ETC.) === -->

          <xsl:if test="$commentLabel != &quot;&quot; and $comment != &quot;&quot;">
            <fo:block padding-bottom="0.225cm" font-size="9pt">
              <fo:table table-layout="fixed" width="100%" border-collapse="collapse">
                <fo:table-column column-width="20.000%" column-number="1"/>
                <fo:table-column column-width="80.000%" column-number="2"/>
                <fo:table-body>
                  <fo:table-row>
                    <fo:table-cell>
                      <fo:block font-weight="bold" color="{$headerTextColour}"> <xsl:value-of select="$commentLabel"/> </fo:block>
                    </fo:table-cell>
                    <fo:table-cell>
                      <fo:block white-space-collapse="false" linefeed-treatment="preserve"> <xsl:value-of disable-output-escaping="no" select="$comment"/> </fo:block>
                    </fo:table-cell>
                  </fo:table-row>
                </fo:table-body>
              </fo:table>
            </fo:block>
          </xsl:if>

          <xsl:if test="$deliveryDetailsLabel != &quot;&quot; and $deliveryDetails != &quot;&quot;">
            <xsl:call-template name="labelValueTable">
              <xsl:with-param name="label" select="$deliveryDetailsLabel"/>
              <xsl:with-param name="value" select="$deliveryDetails"/>
            </xsl:call-template>
          </xsl:if>

          <xsl:if test="$paymentDueDateLabel != &quot;&quot; and $isInvoice">
            <xsl:call-template name="labelValueTable">
              <xsl:with-param name="label" select="$paymentDueDateLabel"/>
              <xsl:with-param name="value" select="$paymentDueDateUserFormatted"/>
            </xsl:call-template>
          </xsl:if>

          <xsl:if test="$bankNameAddressLabel != &quot;&quot; and $bankNameAddress != &quot;&quot; and $isInvoice">
            <xsl:call-template name="labelValueTable">
              <xsl:with-param name="label" select="$bankNameAddressLabel"/>
              <xsl:with-param name="value" select="$bankNameAddress"/>
            </xsl:call-template>
          </xsl:if>

          <xsl:if test="$bankAccountNameLabel != &quot;&quot; and $bankAccountName != &quot;&quot; and $isInvoice">
            <xsl:call-template name="labelValueTable">
              <xsl:with-param name="label" select="$bankAccountNameLabel"/>
              <xsl:with-param name="value" select="$bankAccountName"/>
            </xsl:call-template>
          </xsl:if>

          <xsl:if test="$bankAccountSortCodeLabel != &quot;&quot; and $bankAccountSortCode != &quot;&quot; and $isInvoice">
            <xsl:call-template name="labelValueTable">
              <xsl:with-param name="label" select="$bankAccountSortCodeLabel"/>
              <xsl:with-param name="value" select="$bankAccountSortCode"/>
            </xsl:call-template>
          </xsl:if>

          <xsl:if test="$bankAccountNumberLabel != &quot;&quot; and $bankAccountNumber != &quot;&quot; and $isInvoice">
            <xsl:call-template name="labelValueTable">
              <xsl:with-param name="label" select="$bankAccountNumberLabel"/>
              <xsl:with-param name="value" select="$bankAccountNumber"/>
            </xsl:call-template>
          </xsl:if>

          <xsl:if test="$bankAccountIBANLabel != &quot;&quot; and $bankAccountIBAN != &quot;&quot; and $isInvoice">
            <xsl:call-template name="labelValueTable">
              <xsl:with-param name="label" select="$bankAccountIBANLabel"/>
              <xsl:with-param name="value" select="$bankAccountIBAN"/>
            </xsl:call-template>
          </xsl:if>

          <xsl:if test="$paymentTermsLabel != &quot;&quot; and $paymentTerms != &quot;&quot;">
            <xsl:call-template name="labelValueTable">
              <xsl:with-param name="label" select="$paymentTermsLabel"/>
              <xsl:with-param name="value" select="$paymentTerms"/>
            </xsl:call-template>
          </xsl:if>

          <xsl:if test="$termsConditionsLabel != &quot;&quot; and $termsConditions != &quot;&quot;">
            <xsl:call-template name="labelValueTable">
              <xsl:with-param name="label" select="$termsConditionsLabel"/>
              <xsl:with-param name="value" select="$termsConditions"/>
            </xsl:call-template>
          </xsl:if>

          <xsl:if test="$orderDetailsLabel != &quot;&quot; and $orderDetails != &quot;&quot;">
            <xsl:call-template name="labelValueTable">
              <xsl:with-param name="label" select="$orderDetailsLabel"/>
              <xsl:with-param name="value" select="$orderDetails"/>
            </xsl:call-template>
          </xsl:if>

          <!-- === SIGNATURE BLOCK === -->

          <xsl:if test="$isQuotation or $isSalesOrder or $isContract">
            <xsl:if test="$yourPOLabel != &quot;&quot; or $printNameLabel != &quot;&quot; or $positionLabel != &quot;&quot; or $signatureLabel != &quot;&quot; or $dateSignatureLabel != &quot;&quot;">
              
              <fo:block space-before.optimum="40pt" space-after.optimum="0pt"> <fo:inline> &#160; </fo:inline> </fo:block>
           
              <fo:table table-layout="fixed" width="50%" border-collapse="collapse">
                <fo:table-column column-width="50%" column-number="1"/>
                <fo:table-column column-width="50%" column-number="2"/>
                <fo:table-body>

                  <xsl:call-template name="signatureBlockTableRowIfLabel"> <xsl:with-param name="label" select="$yourPOLabel"/> </xsl:call-template>
                  <xsl:call-template name="signatureBlockTableRowIfLabel"> <xsl:with-param name="label" select="$printNameLabel"/> </xsl:call-template>
                  <xsl:call-template name="signatureBlockTableRowIfLabel"> <xsl:with-param name="label" select="$positionLabel"/> </xsl:call-template>
                  <xsl:call-template name="signatureBlockTableRowIfLabel"> <xsl:with-param name="label" select="$signatureLabel"/> </xsl:call-template>
                  <xsl:call-template name="signatureBlockTableRowIfLabel"> <xsl:with-param name="label" select="$dateSignatureLabel"/> </xsl:call-template>

                </fo:table-body>
              </fo:table>
            </xsl:if>
          </xsl:if>

          <xsl:if test='position()=last()'>
            <fo:block id="pageNumberCitation1"/>
          </xsl:if>
        </fo:flow>
        
      </fo:page-sequence>
    </fo:root>
  </xsl:template>
  
  <!-- ==== HELPERS ==== -->
  
  <xslt:template name="chooseColour">
    <xslt:param name="colour"/>

    <xsl:choose>
      <xsl:when test="$colour != &quot;&quot;"> <xsl:value-of select="$colour"/> </xsl:when>
      <xsl:otherwise> <xsl:value-of select="$black"/> </xsl:otherwise>
    </xsl:choose>
  </xslt:template>

  <xslt:template name="labelValueTableRowIfLabelAndValue">
    <xslt:param name="label"/>
    <xslt:param name="value"/>

    <xsl:if test="$label != &quot;&quot; and $value != &quot;&quot;">
      <xsl:call-template name="labelDefaultValueTableRow">
        <xsl:with-param name="label" select="$label"/>
        <xsl:with-param name="defaultLabel" select=""/>
        <xsl:with-param name="value" select="$value"/>
      </xsl:call-template>
    </xsl:if>
  </xslt:template>
  
  <xslt:template name="labelDefaultValueTableRow">
    <xslt:param name="label"/>
    <xslt:param name="defaultLabel"/>
    <xslt:param name="value"/>

    <fo:table-row>
      <fo:table-cell>
        <fo:block font-weight="bold" color="{$headerTextColour}">
          <xsl:choose>
            <xsl:when test="$label != &quot;&quot;"> <xsl:value-of select="$label"/> </xsl:when>
            <xsl:otherwise> <xsl:value-of select="$defaultLabel"/> </xsl:otherwise>
          </xsl:choose>
        </fo:block>
      </fo:table-cell>
      <fo:table-cell>
        <fo:block text-align="right">
          <xsl:value-of select="$value"/>
        </fo:block>
      </fo:table-cell>
    </fo:table-row>
  </xslt:template>
  
  <xslt:template name="labelValueTable">
    <xslt:param name="label"/>
    <xslt:param name="value"/>

    <fo:block padding-bottom="0.225cm" font-size="9pt">
      <fo:table table-layout="fixed" width="100%" border-collapse="collapse">
        <fo:table-column column-width="20.000%" column-number="1"/>
        <fo:table-column column-width="80.000%" column-number="2"/>
        <fo:table-body>
          <fo:table-row>
            <fo:table-cell>
              <fo:block font-weight="bold" color="{$headerTextColour}"> <xsl:value-of select="$label"/> </fo:block>
            </fo:table-cell>
            <fo:table-cell>
              <fo:block> <xsl:value-of select="$value"/> </fo:block>
            </fo:table-cell>
          </fo:table-row>
        </fo:table-body>
      </fo:table>
    </fo:block>
  </xslt:template>
  
  <xslt:template name="labelValueCenteredText">
    <xslt:param name="label"/>
    <xslt:param name="defaultLabel"/>
    <xslt:param name="value"/>

    <xsl:if test="$value != &quot;&quot;">
      <fo:block text-align="center">
        <fo:inline>
          <xsl:choose>
            <xsl:when test="$label != &quot;&quot;">
              <xsl:value-of select="$label"/>
            </xsl:when>
            <xsl:otherwise>
              <xsl:value-of select="$defaultLabel"/>
            </xsl:otherwise>
          </xsl:choose>
        </fo:inline>
        &#160;
        <fo:inline>
          <xsl:value-of select="$value"/>
        </fo:inline>
      </fo:block>
    </xsl:if>
  </xslt:template>

  <xslt:template name="tableHeaderCell">
    <xslt:param name="label"/>
    <xslt:param name="defaultLabel"/>
    <xslt:param name="textAlign"/>

    <fo:table-cell border-width="1pt" border-style="solid" padding="2pt" text-align="{$textAlign}" border-color="{$tableBorderColour}">
      <fo:block font-weight="bold" color="{$tableHeaderTextColour}">
        <fo:inline>
          <xsl:choose>
            <xsl:when test="$label != &quot;&quot;"> <xsl:value-of select="$label"/> </xsl:when>
            <xsl:otherwise> <xsl:value-of select="$defaultLabel"/> </xsl:otherwise>
          </xsl:choose>
        </fo:inline>
      </fo:block>
    </fo:table-cell>
  </xslt:template>

  <xslt:template name="tableBodyCell">
    <xslt:param name="value"/>
    <xslt:param name="textAlign"/>

    <fo:table-cell border-width="1pt" border-style="solid" padding="2pt" text-align="{$textAlign}" border-color="{$tableBorderColour}">
      <fo:block font-size="8pt"> <fo:inline> <xsl:value-of select="$value"/> </fo:inline> </fo:block>
    </fo:table-cell>
  </xslt:template>

  <xslt:template name="signatureBlockTableRowIfLabel">
    <xslt:param name="label"/>

    <xsl:if test="$label != &quot;&quot;">
      <fo:table-row keep-with-next="always">
        <fo:table-cell border-width="1pt" border-style="solid" border-color="$tableBorderColour" padding="5pt" text-align="left" background-color="$tableHeaderColour">
          <fo:block font-weight="bold" color="$tableHeaderTextColour">
            <fo:inline> <xsl:value-of select="$label"/> </fo:inline>
          </fo:block>
        </fo:table-cell>
        <fo:table-cell border-width="1pt" border-style="solid" border-color="$tableBorderColour" padding="5pt" text-align="left"> &#160; </fo:table-cell>
      </fo:table-row>
    </xsl:if>
  </xslt:template>

  <!-- ==== FORMATTERS ==== -->
  
  <!-- iso8601-date must be yyyy-mm-dd for this to work correctly-->
  <xslt:template name="date:format-iso8601-date">
    <xslt:param name="iso8601-date"/>

    <xslt:variable name="format">
      <xsl:choose>
        <xsl:when test="/hash/text/Date_Format != &quot;&quot;">
          <xsl:value-of select="/hash/text/Date_Format"/>
        </xsl:when>
        <xsl:otherwise>
          "dd/MM/yyyy"
        </xsl:otherwise>
      </xsl:choose>
    </xslt:variable>

    <xsl:choose>
      <xsl:when test="$format = &quot;yyyy-MM-dd&quot;">
        <xsl:value-of select="$iso8601-date"/>
      </xsl:when>
      <xsl:when test="$format = &quot;MM/dd/yyyy&quot;">
        <xsl:value-of select="substring($iso8601-date, 6, 2)"/>/<xsl:value-of select="substring($iso8601-date, 9, 2)"/>/<xsl:value-of select="substring($iso8601-date, 1, 4)"/>
      </xsl:when>
      <!-- Default to dd/MM/yyyy -->
      <xsl:otherwise>
        <xsl:value-of select="substring($iso8601-date, 9, 2)"/>/<xsl:value-of select="substring($iso8601-date, 6, 2)"/>/<xsl:value-of select="substring($iso8601-date, 1, 4)"/>
      </xsl:otherwise>
    </xsl:choose>
  </xslt:template>
  
</xslt:stylesheet>

