# Packer Explored

[Packer](https://www.packer.io) is an open source tool from [hashicorp](https://www.hashicorp.com/) for creating identical machine images for multiple platforms [like aws, azure, gcp, docker ,...etc]  from a single source configuration.
Packer configuration is written in JSON and as of v1.5 hcl2 is supported {still some features are under implementation stage}.

## Installation

[Packer CLI](https://www.packer.io/downloads) is available for all major platforms and can be downloaded from [here](https://www.packer.io/downloads)

## ENV variables & credentials

AWS Access Key and AWS Secret Key are set in environment variable.

```bash
$ export AWS_ACCESS_KEY_ID="anaccesskey"
$ export AWS_SECRET_ACCESS_KEY="asecretkey"

```

> ### Note:
> Setting your AWS credentials using either the above environment variables will override the use of `AWS_SHARED_CREDENTIALS_FILE` and `AWS_PROFILE`.


### building 

`packer build <filename>` will start building the machine image.

> Note:
>   when tried to build image with hcl template file, the image was not created and the cli didn't throw error too. just exited with `no resource created` shell output. JSON format works properly.