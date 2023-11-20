# 개요
* S3 버킷을 캐싱하는 CloudFront

<br>

# 주의사항
* [TTL이 300초](./terraform/cloudfront.tf#L39)로 설정되어 있습니다.

<br>

# 사용방법

* 약 3~5분 소요

```bash
cd terraform
terraform init
terraform apply
```

* CloudFront 도메인 확인

```bash
$ terraform output
cloudfront_domain_name = "xxxxx.cloudfront.net"
```

* CloudFront 조회

```bash
$ curl -D - https://xxxxxxx.cloudfront.net/

...
etag: "eaa93e3e0dfef6359fb8c3b24db7b997"
x-amz-server-side-encryption: AES256
accept-ranges: bytes
server: AmazonS3
x-cache: Hit from cloudfront
via: 1.1 501c4b7f34424b91df8fa1ce02fa65e8.cloudfront.net (CloudFront)
x-amz-cf-pop: ICN51-C2
x-amz-cf-id: ioAajHcmymTlbXA0akSQNfLOiXCPTQeKgoPvhcG7kqRLsXbB7qAG4Q==
age: 5

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
</head>
<body>
  Hello World
</body>
</html>
```

<br>

# 캐싱 테스트 방법
* index.html을 변경(terraform apply도 같이 실행)하면서 웹 브라우저 또는 curl 응답헤더를 분석

```bash
$ curl -D - https://xxxxxxx.cloudfront.net/

...
x-cache: Hit from cloudfront
```

<br>

# 삭제방법

```bash
cd terraform
terraform destroy
```

<br>

# 참고자료
1. cache 설정: https://toss.tech/article/smart-web-service-cache
2. cache-control 설정방법: https://medium.com/@xpiotrkleban/cloudfront-and-terraform-essentials-how-to-optimize-content-delivery-27c84e8aef04
3. terrafom code: https://github.com/riboseinc/terraform-aws-s3-cloudfront-website/blob/master/
4. terrafom code: https://awstip.com/aws-cloudfront-with-s3-as-origin-using-terraform-a369cdadc541
5. terrafom code: https://medium.com/@thearaseng/build-s3-static-website-and-cloudfront-using-terraform-and-gitlab-888a8ec1d37d
