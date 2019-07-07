import boto3

region = 'us-east-1'
ec2 = boto3.client('ec2', region_name=region)


def lambda_handler(event, context):
    instances_start = []
    instances_stop = []
    
    if event.get('start'):
        instances_start = event['start']
    if event.get('stop'):
        instances_stop = event['stop']    
    
    if instances_start:
        try:
            ec2.start_instances(InstanceIds=instances_start)
            print('started your instances: ' + str(instances_start))
        except Exception as e:
            print('erro start instances: ' + str(instances_start))
            print (e)
            
    if instances_stop:
        try:
            ec2.stop_instances(InstanceIds=instances_stop)
            print('stopped your instances: ' + str(instances_stop))
        except Exception as e:
            print('erro stop instances: ' + str(instances_stop))
            print (e)
