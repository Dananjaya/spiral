<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="_Default" %>
<%@ Register tagPrefix="Boyds" TagName="SearchBox" Src="~/Controls/SearchBoxLowProfile.ascx" %>
<%@ Register Src="~/WebShellControls/ContentWithEditor.ascx"  TagPrefix="WebShell" TagName="ContentWithEditor" %>
<%@ Register Src="~/WebShellControls/PageAdminLinks.ascx"  TagPrefix="WebShell" TagName="PageAdminLinks" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
   

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Body" Runat="Server">
    
     <div class="row">
        <div class="col-md-12 col-sm-12" ID="WideFOX" Runat="Server">
            <p>  
                <asp:Repeater ID="RPTDiscountGroupBanners" ItemType="System.String" SelectMethod="RPTDiscountGroupBanners_GetData" runat="server">
                    <ItemTemplate>             
                            <a href="/Store/Results.aspx?tag=<%#Item %>">
                                 <img src="/images/home/DiscountGroupBanners/<%#Item %>.jpg" class="img-responsive" alt="Fox17">
                             </a>
                    </ItemTemplate>
                </asp:Repeater>
                </p>
            </div>
        <div class="col-md-12 col-sm-12" ID="WideSale" Runat="Server">
            <p>               
            <a href="/Store/Results.aspx?filter=On_Sale">
                            <img src="/images/home/MIDYEARSALE17_FullWidth.jpg" class="img-responsive" alt="MID YEAR SALE">
             </a>
                </p>
            </div>
     </div>
     <div class="row">
        <div class="col-md-6 col-sm-6">
            <p>               
                <asp:Repeater ID="RptSales" ItemType="VBCode.StoreEntity.BannerCreationLog" SelectMethod="RptSales_GetData" runat="server">
                    <ItemTemplate>
                        <a href="/Store/Results.aspx?filter=On_Sale">
                            <img src="/Editable/BannerSaves/<%#Item.ImageName %>?l=<%#Item.LogID %> " class="img-responsive" alt="Featured Bike">
                        </a>
                    </ItemTemplate>
                </asp:Repeater>
                <a href="/Store/Results.aspx?filter=On_special" id="LinkNoSales" runat="server" >
                        <img src="/images/home/this-weeks-accessory-specials.png" class="img-responsive" alt="this weeks accessory specials">
                </a>
            </p>
        </div>
        <div class="col-md-6 col-sm-6">
            <p>      
                <a href="/Store/Results.aspx?filter=New_in_store">   
                        <img src="/images/home/NEW-IN-STORE.PNG" class="img-responsive" alt="NEW IN STORE">
                    </a>
            </p>

        </div>
      </div>  
    <div class="row">
        <div class="col-md-6 col-sm-6">
            <p>                
                  <asp:Repeater ID="rptFeaturedBike" ItemType="VBCode.StoreEntity.BannerCreationLog" SelectMethod="rptFeaturedBike_GetData" runat="server">
                <ItemTemplate>
                        <a href="<%#Item.Link %>">
                            <img src="/Editable/BannerSaves/<%#Item.ImageName %>?l=<%#Item.LogID %> " class="img-responsive" alt="Featured Bike">
                        </a>
                </ItemTemplate>
            </asp:Repeater>
            </p>
        </div>

        <div class="col-md-6 col-sm-6">




            
    <div id="myCarousel" class="carousel slide" data-ride="carousel">   
        <!-- Wrapper for carousel items -->
        <div class="carousel-inner">

            <asp:Repeater ID="rptBrandPromos" ItemType="VBCode.StoreEntity.BannerCreationLog" SelectMethod="rptBrandPromos_GetData" runat="server">
                <ItemTemplate>
                <div class="item<%# ActiveIfZero(Container.ItemIndex)%>">
                        <a href="<%#Item.Link %>">
                            <img src="/Editable/BannerSaves/<%#Item.ImageName %>?l=<%#Item.LogID %> " class="img-responsive" alt="Brand Promo">
                        </a>
                </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
        <!-- Carousel controls -->
        <a class="carousel-control left" href="#myCarousel" data-slide="prev">
            <span class="glyphicon glyphicon-chevron-left"></span>
        </a>
        <a class="carousel-control right" href="#myCarousel" data-slide="next">
            <span class="glyphicon glyphicon-chevron-right"></span>
        </a>
    </div>




         </div>
      </div> 
    <div class="row">
        <div class="col-md-3 col-sm-6 col-xs-6">
            <p>                
                <a href="/Store/Results.aspx?filter=Clearance">
                        <img src="/images/home/clearance.jpg" class="img-responsive" alt="clearance">
                </a>
            </p>
        </div>
        <div class="col-md-3 col-sm-6 col-xs-6">
            <p>                
                <a data-toggle="lightbox" data-iframe="true" data-type="url" href="/ContactForms/bookAService2.aspx">
                        <img src="/images/home/book a service.jpg" class="img-responsive" alt="book a service">
                </a>
            </p>
        </div>
        <div class="col-md-3 col-sm-6 col-xs-6">
            <p>         
                <a  data-toggle="lightbox" href="http://email.mailroom.co.nz/h/r/66167451FDB92F67">
                        <img src="/images/home/email specials.jpg" class="img-responsive" alt="email specials">
                    </a>
                
            </p>
        </div>
        <div class="col-md-3 col-sm-6 col-xs-6">
            <p>         <a href="/c/Finance">
                            <img src="/images/home/on the spot finance.jpg" class="img-responsive" alt="on the spot finance">
                        </a>
            </p>
        </div>
      </div>
    
    <div class="row">
        <div class="col-md-12 col-sm-12 col-xs-12"> 
             <WebShell:PageAdminLinks id="PageAdminLinks1" runat="server" /> 
              <WebShell:ContentWithEditor id="ContentWithEditorCenter" iPageID="0" AreaName="AboveBanners"  runat="server" /> 
      </div> 
      </div> 
</asp:Content>
