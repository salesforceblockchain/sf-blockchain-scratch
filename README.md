# Create Salesforce Blockchain Scratch Org

## Table of contents
* [Installation Instructions](#installation-instructions)
    * [Option #1](#option-1)
    * [Option #2](#option-1)

## Installation Instructions
We have provided two options to get the scratch org setup and configured.  The fastest way is to use the automated option (option #1), but if you want to follow along, then use option #2.

### Option #1
1. Install Salesforce DX. Enable the Dev Hub in your org or sign up for a Dev Hub trial org and install the Salesforce DX CLI. Follow the instructions in the [Salesforce DX Setup Guide](https://developer.salesforce.com/docs/atlas.en-us.sfdx_setup.meta/sfdx_setup/sfdx_setup_intro.htm?search_text=trial%20hub%20org) or in the [App Development with Salesforce DX](https://trailhead.salesforce.com/modules/sfdx_app_dev) Trailhead module.

1. Clone the **sf-blockchain-scratch** repository:
    ```
    git clone git@git.com:salesforceblockchain/sf-blockchain-scratch.git
    cd sf-blockchain-scratch
    ```

1. Run the automated script to setup, configure, and launch your scratch org.
    ```
    ./scripts/orgInit.sh
    ```

### Option #2
1. Install Salesforce DX. Enable the Dev Hub in your org or sign up for a Dev Hub trial org and install the Salesforce DX CLI. Follow the instructions in the [Salesforce DX Setup Guide](https://developer.salesforce.com/docs/atlas.en-us.sfdx_setup.meta/sfdx_setup/sfdx_setup_intro.htm?search_text=trial%20hub%20org) or in the [App Development with Salesforce DX](https://trailhead.salesforce.com/modules/sfdx_app_dev) Trailhead module.

1. Clone the **sf-blockchain-scratch** repository:
    ```
    git clone git@git.com:salesforceblockchain/sf-blockchain-scratch.git
    cd sf-blockchain-scratch
    ```

1. Create a scratch org and provide it with an alias of your choice (**blockchain** in the command below):
    ```
    sfdx force:org:create -s -f config/project-scratch-def.json -a blockchain
    ```
    
1. Push the app to your scratch org:
    ```
    sfdx force:source:push
    ```

1. Assign the **salesforce_blockchain** permission set to the default user:
    ```
    sfdx force:user:permset:assign -n salesforce_blockchain
    ```

1. Install the Salesforce Blockchain managed package into the scratch org.
    ```
    sfdx force:package:install --package 04t1U000007I6SK -w 10 -r
    ```
    
1. Provision C2C for the scratch org.    
    ```
    sfdx force:apex:execute -f scripts/EnableC2C.apex
    ```

1. Open the scratch org:
    ```
    sfdx force:org:open -p /lightning/page/home
    ```

