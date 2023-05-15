import boto3

def create_cpu_alarm(instance_id):
    client = boto3.client('cloudwatch')
    
    alarm_name = 'High_CPU_Alarm'
    metric_name = 'CPUUtilization'
    namespace = 'AWS/EC2'
    comparison_operator = 'GreaterThanThreshold'
    threshold = 80.0
    evaluation_periods = 5
    period = 60  # in seconds
    alarm_description = 'Alarm when CPU usage exceeds 80% for 5 consecutive minutes'
    alarm_actions = ['arn:aws:sns:us-east-1:252820710416:alert.fifo']
    statistic = 'Average'
    
    response = client.put_metric_alarm(
        AlarmName=alarm_name,
        ComparisonOperator=comparison_operator,
        EvaluationPeriods=evaluation_periods,
        MetricName=metric_name,
        Namespace=namespace,
        Period=period,
        Threshold=threshold,
        AlarmDescription=alarm_description,
        AlarmActions=alarm_actions,
        Statistic=statistic,
        Dimensions=[
            {
                'Name': 'InstanceId',
                'Value': instance_id
            }
        ]
    )
    
    print('CloudWatch alarm created successfully!')

instance_id = 'i-040f600270cc9ce1f'
create_cpu_alarm(instance_id)