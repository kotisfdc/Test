<aura:application >
    
    <link href='/resource/bootstrap/' rel="stylesheet"/>
    <div class="navbar navbar-default navbar-static-top" role="navigation">
        <div class="container">
            <div class="navbar-header">
                <a href="#" class="navbar-brand">Customer Registration Form</a>
            </div>
        </div>
    </div>
    
    <div class="container">
        <div class="row">
            <div class="col-sm-8">
                <c:CustomerSearchBar />
                <c:RetrieveCustomerDetails />
            </div> 
            
        </div>
        <div class="col-sm-4">
            <c:LabelDetailsComponent />
        </div>   
    </div>
    
    
</aura:application>