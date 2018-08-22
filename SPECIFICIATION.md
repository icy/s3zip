## Specification

`s3zip` expects `YAML` contents that contain array of policy specification.
Here is the basic specification in `EBNF` syntax.

```
s3zip_policies        <=  s3zip_array
s3zip_array           <=  "[" s3zip_policy_list "]"
s3zip_policy_list     <=   s3zip_policy_hash{, s3zip_policy_hash}
s3zip_policy_hash     <=  "{" s3zip_policy_kv_list "}"
s3zip_policy_kv_list  <=  s3zip_policy_kv{, s3zip_policy_kv}
s3zip_policy_kv       <=  "if" ":" if_v |
                          "user" ":" user_v |
                          "do" ":" do_v |
                          "env" ":" env_v |
                          "bucket" ":" bucket_v
if_v                  <=  aws_condition_statements[1]
env_v                 <=  array_of_string
bucket_v              <=  string | array_of_string
user_v                <=  string | array_of_string
do_v                  <=  do_v_array
do_v_array            <=  "[" do_v_policy_list "]"
do_v_policy_list      <=  do_v_policy{, do_v_policy}
do_v_policy           <=  "{" do_v_kv_list "}"
do_v_kv_list          <=  do_v_kv{, do_v_kv}
do_v_kv               <=  "if" ":" if_v |
                          "bucket" ":" bucket_v |
                          "path" ":" path_v |
                          "perm" ":" perm_v
path_v                <=  string | array_of_string
perm_v                <=  perm_alias | array_of_string
perm_alias            <=  "LIST" | "READ" | "ALL"
array_of_string       <=  "[" string{,string} "]"
```

## Parsing rules

1. `do_v_kv` may inherit from `s3zip_policy_kv`: If there is a `key`
   that is missing in `do_v_kv`, its key is expected to be in `s3zip_policy_kv`.
2. `user_v` is a user or a list of IAM user(s). Restriction of Terraform
    and/or AWS ARN specification is applied.
3. `bucket_v` is a bucket or a list of bucket(s). Restriction of Terraform
    and/or AWS bucket specification is applied.
4. `aws_condition_statements` is a string that displays list of conditions [1],
    each condition is a valid `JSON` string display.

## Output rules

1. `s3zip` parses its input (`s3zip_policies`) and generates policies for
    each bucket found from all policies.

## References

1. AWS Conditions Statements [1]: https://docs.aws.amazon.com/AmazonS3/latest/dev/amazon-s3-policy-keys.html
