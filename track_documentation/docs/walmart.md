# Walmart Workflow

## Walmart Product CSV file
* Import a file from Jose Camino (testing purposes).  Client drops on FTP, and cron to collect the job

## Projects
* Create a project manually

## Walmart GeC Project Import XLSX file
* Under Project in the modal, select the project you just created (see above)
* File: Import a file from Jose Camino

## Projects
* back to project

!!! Warning "NOTE:"
    Each product **MUST** have a vendor name

* Edit the product
    * Add Quantity
    * Add Sample due date
    * Vendor Email address
    * Studio Name (dropdown)

## Request SAMPLES
* Select the product
* in the Selected tab, click more actions button, click Request SAMPLES
* DIALOG: 1 sample has been requested - green dialog is displayed

## Sourcing Tab
* Most recent at the top
    * confirm
* click most recent, goes to sample request show page
* click EDIT button
* click on "Truck" icon under tracking NUMBER
* Generate Internal Tracking NUMBER
    * add shipping carrier
    * add est. delivery date
    * click Generate
* Save Internal tracking number - then close
* Pass tracking number field and SAVE
* DIALOG: 1 sample updated successfully
* Save BARCODE number as well

## Projects
* Verify status of product went to FULFILLED

## Track Tab
* enter barcode, Receive, hit Enter
* print label or Reject are AVAILABLE
* Send, enter barcode, hit Enter
    * if more than 1 project, you'll need to Cancel or Continue
    * if you reject a sample, and request another, it will create a brand new sample request (incremented sample request number) under sourcing tab
