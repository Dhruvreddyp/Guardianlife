import boto3
from datetime import datetime
sts_client = boto3.client('sts')
response = sts_client.assume_role(
    RoleArn='arn:aws:iam::AccountB-ID:role/sns-publish-role',
)
credentials = response['Credentials']
session = boto3.Session(
    aws_access_key_id=credentials['AccessKeyId'],
    aws_secret_access_key=credentials['SecretAccessKey'],
    aws_session_token=credentials['SessionToken']
)
sns_client = session.client('sns', region_name='us-east-1')
response = sns_client.publish(
    TopicArn='arn:aws:sns:us-east-1:AccountB-ID:cross-account-topic',
    Message=f'Hello from server A at {datetime.now()}'
)