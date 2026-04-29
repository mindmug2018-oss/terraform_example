# terraform_example/test02_basic/variable02/main.tf


# 여러 개의 type 을 map 에 담고 싶으면 object type 을 사용하면 된다
variable "member1" {
    # number, string, bool type 을 담을 수 있는 object type 선언
    type = object ({
        num     = number
        name    = string
        is_man  = bool
    })
    # 설명
    description = "회원 한명의 정보 입니다"
    # 기본값 대입
    default = {
        num     = 1
        name    = "shin"
        is_man  = true
    }
}


variable "bucket_config" {
    type = object({
        # 반드시 넣어야 하는 값
        name = string
        # 안 넣어도 되는 값 : optional(type, default 값)
        region = optional(string, "ap-northeast-2")
        # optional 이면서 bool type 이고 넣지 않으면 false 로 설정된다
        version = optional(bool, false)
    })


    description = "bucket 기본 설정 값입니다"


    default = {
        name = "나의 기본 s3 bucket 입니다"
        # region 과 versioning 은 생략 했으므로 위에서 정의한 optional 기본 값이 설정된다
    }
}


# 위에서 선언한 member1, bucket_config object 안에 저장된 내용을 output 을 통해서 출력하기
output "debug01_member1" {
    value = "번호 : ${var.member1.num}, 이름 : ${var.member1.name}, 남자 여부 : ${var.member1.is_man}"
}


output "debug02_bucket_config" {
    value = "이름 : ${var.bucket_config.name}, 지역 : ${var.bucket_config.region}, 버저닝 : ${var.bucket_config.version}"
}
