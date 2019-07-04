import boto3
region = 'us-east-1'

rds = boto3.client('rds', region_name=region)

instances_start = []
instances_stop = []

def lambda_handler(event, context):
    if event['start']:
        instances_start = event['start']
    if event['stop']:
        instances_stop = event['stop']    
    
    for instance in instances_start:
        try:
            rds.start_db_instance(DBInstanceIdentifier=instance)
            print('started your instances: ' + str(instance))
        except Exception as e:
            print('erro start instances: ' + str(instance))
            print (e)
            
    for instance in instances_stop:
        try:
            rds.stop_db_instance(DBInstanceIdentifier=instance)
            print('stopped your instances: ' + str(instance))
        except Exception as e:
            print('erro stop instances: ' + str(instance))
            print (e)


