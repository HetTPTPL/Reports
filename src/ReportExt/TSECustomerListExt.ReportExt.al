reportextension 50150 "TSE Customer List Ext" extends "Customer - List"
{

    dataset
    {
        add(Customer)
        {
            column(Address; Address)
            {
            }
        }
    }

    rendering
    {
        layout(LayoutName)
        {
            Type = RDLC;
            LayoutFile = 'CustomerList.rdl';
        }
    }
}