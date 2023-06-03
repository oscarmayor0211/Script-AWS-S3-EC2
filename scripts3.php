require 'vendor/autoload.php';

use Aws\S3\S3Client;
use Aws\Credentials\Credentials;

$credentials = new Credentials('', '');

$s3 = new S3Client([
    'version' =>'latest',
    'region' => 'us-east-2',
    'credentials' = $credentials
    ]);

    $result =$s3->listBuckets();

    foreach($result['Buckets']) as $buckets){
        echo $bucket['Name'] . "\n";
    }