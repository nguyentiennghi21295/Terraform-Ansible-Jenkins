terraform {
  backend "s3" {
    bucket         = "terraform-blueberry21295"  # Replace with your bucket name
    key            = "terraform/my-state.tfstate"            # Desired path in the bucket to store state
    region         = "eu-west-1"                 # Replace with the region of your bucket
    # If you use a DynamoDB table for state locking (recommended)
    # dynamodb_table = "my-terraform-state-lock" # Uncomment and replace with your DynamoDB table name if you use one
    # encrypt        = true                      # Uncomment if you want to use server-side encryption
  }
}
