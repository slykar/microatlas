import boto3

TILES_BUCKET = 'sly-proto-mapping'

s3 = boto3.client('s3')


def get_tile(layer, zoom, x, y):
    object_key = f'{layer}/{zoom}/{x}/{y}.png'
    try:
        response = s3.get_object(Bucket=TILES_BUCKET, Key=object_key)
    except s3.exceptions.NoSuchKey as e:
        raise TileNotFound

    return response['Body']


class TileNotFound(Exception):
    pass
