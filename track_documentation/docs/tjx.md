# TJX Workflow
covers how to test the TJX workflow from start to finish

2 types of files are available in import

* TJX Product Overlay CSV file  (starting point)
* TJX Collection CSV file


# Let's Begin... (FEED-1348)

## TJX Product Overlay CSV file
* Import a file from Jose Camino (testing purposes).  Client drops on FTP, and cron to collect the job

## TJX Collection CSV file

## Project tab
* Create a project manually - ECOM types
* Status of project OPEN

## Browse tab
* Filter by NO SAMPLE & AVAILABLE
* Click a couple of products
* Go to Selected tab (#)
* MORE ACTIONS: Add to project and select project you just made
    * if you receive the products are not available error, you can force add
* ASK JOSE CAMINO TO RUN JOB REQUESTING SAMPLES
* Project status will now be closed after this run
* Verify product statuses move from proposed to requested
* ANOTHER JOB TO BE RUN FOR CONFIRMATION PICKLIST (???????)
* Check Imports for PICKLIST file and Confirmation list
* Products will now be confirmed after receiving Confirmation list

## From Project show, click on PRODUCT sku
* Goes to product show page
* copy sample barcode
* SAVE STYLE CODE NUMBER

## Track tab
* Click on receive
* choose a COMPANY LOCATION
* Select sub location
* paste barcode that was Selected & Enter
* Label is generated

# END OF TRACK MODULE Workflow

## Go to View
* Go the the COMPANY LOCATIONS (known as Studio in View) that was Selected
* go to Advanced Search
* select TJX as Client
* In Style Number field, paste STYLE CODE NUMBER saved previously
* click Green Check mark
* Click Green SEARCH button
* SKU/STYLE number should match

# RESUME OF TRACK MODULE Workflow

## Projects tab
* product page, product show page
* Status should now be IN PRODUCTION

# END OF TRACK MODULE Workflow, pt. 2

## Go to COPY
* paste style number
* Click on Search
* verify style number is in COPY
* click on EYE Icon
* Verify style number matches TRACK
* Verify name matches TRACK
* Click REWORK button
    * verify status is now STARTED
    * change some data
* click SAVE (blue top)
* click SUBMIT TO QC
* Confirm description - click OK
* click APPROVE
* click DROP

## VIEW
* Go to single asset view
* modify Drop Shot

## Track
* Send back sample via TRACK tab
    * click FORCE SEND if all samples do not have date shot value
* Check transactions tab
    * should have values for CREATED, RECEIVED, and SENT
