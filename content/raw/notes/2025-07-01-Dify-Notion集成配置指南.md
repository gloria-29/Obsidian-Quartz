---
标题: Dify Notion集成配置指南
笔记 ID: 0197c398-32b4-7a39-a20f-67c6b7f1c702
笔记类型: note
tags:
    - 生活/电子工具
卡片盒:
    - 工作
包含语音: 否
网页链接:
创建时间: "2025-07-01T09:31:12"
更新时间: "2026-03-04T20:29:54.932"
---

# Dify DeepWiki

URL: [https://deepwiki.com/search/docker-composenotionnotionerro\_56fe7d50-ddf8-4689-874f-f8c951aa6c99](https://deepwiki.com/search/docker-composenotionnotionerro_56fe7d50-ddf8-4689-874f-f8c951aa6c99)

[Get free private DeepWikis in Devin](chrome-extension://ldmmifpegigmeammaeckplhnjbbpccmm/private-repo)

[DeepWiki](https://deepwiki.com/)

[Get free private DeepWikis with](chrome-extension://ldmmifpegigmeammaeckplhnjbbpccmm/private-repo)

[Devin](chrome-extension://ldmmifpegigmeammaeckplhnjbbpccmm/private-repo)

Share

[return to langgenius/dify](chrome-extension://ldmmifpegigmeammaeckplhnjbbpccmm/langgenius/dify)

我通过docker compose部署了这个项目后，在向知识库里导入Notion来源的内容时，无法跳转打开Notion开发者页面，出现了如下报错：{“error”:“invalid\_request”,“error\_description”:&quot;query failed validation: query. client\_id should be a string or \&#96;undefined, ins…

Hide full text我通过docker compose部署了这个项目后，在向知识库里导入Notion来源的内容时，无法跳转打开Notion开发者页面，出现了如下报错：{“error”:“invalid\_request”,“error\_description”:“query failed validation: query. client\_id should be a string or \&#96;undefined, instead was 0’.”,“request\_id”:“8cd9fc37-6712-49e7-b8b1-9abf7511b1da”]

Deep

Searched across langgenius/dify

Thought Process

根据您提供的错误信息，问题出现在Notion集成的&#96;client_id&#96;配置上。错误显示&#96;client_id should be a string or undefined, instead was 0&#96;，这表明&#96;client_id&#96;被设置为数字0而不是字符串。

## 问题分析

这个问题通常是因为Docker Compose部署时没有正确配置&#96;NOTION_CLIENT_ID&#96;环境变量造成的。在Dify的配置中，Notion集成需要正确的客户端ID来进行OAuth认证。

## 解决方案

您需要在Docker部署配置中正确设置&#96;NOTION_CLIENT_ID&#96;环境变量：

1. **检查环境变量配置**：Dify在Docker部署中使用&#96;NOTION_CLIENT_ID&#96;环境变量来配置Notion集成 .env.example:718

2. **获取Notion Client ID**：您需要先在Notion开发者页面创建一个应用程序来获取真实的Client ID，而不是使用默认的占位符值

3. **配置Docker环境变量**：在您的Docker Compose配置中，确保正确设置了&#96;NOTION_CLIENT_ID&#96;为字符串值，而不是数字0

4. **重启服务**：修改环境变量后，需要重新启动Docker Compose服务使配置生效

## 配置要求

Notion集成的OAuth认证通过&#96;NotionOAuth&#96;类实现 oauth\_data\_source.py:1 ，该类需要有效的字符串类型的&#96;client_id&#96;参数进行初始化 data\_source\_oauth.py:19 。

## Notes

1. 确保您已经在Notion开发者控制台创建了集成应用并获取了有效的Client ID

2. &#96;NOTION_CLIENT_ID&#96;必须设置为字符串类型，不能是数字或留空

3. 同时还需要配置&#96;NOTION_CLIENT_SECRET&#96;才能完成OAuth流程

4. 如果您使用的是内部集成而非公共集成，可能需要配置不同的环境变量

请检查您的&#96;.env&#96;文件或Docker Compose配置，确保&#96;NOTION_CLIENT_ID&#96;被正确设置为从Notion开发者页面获取的字符串值。

Copy ResponseShare

[langgenius/dify](https://github.com/langgenius/dify)[docker/.env.example](https://github.com/langgenius/dify/blob/ef20f694/docker/.env.example)

&#96;&#96;&#96;

715NOTION_INTEGRATION_TYPE&#61;public

716# Notion OAuth client secret (used for public integration type)

717NOTION_CLIENT_SECRET&#61;


718# Notion OAuth client id (used for public integration type)


719NOTION_CLIENT_ID&#61;

720# Notion internal integration secret.

721# If the value of NOTION_INTEGRATION_TYPE is &quot;internal&quot;,

&#96;&#96;&#96;

[langgenius/dify](https://github.com/langgenius/dify)[api/libs/oauth\_data\_source.py](https://github.com/langgenius/dify/blob/ef20f694/api/libs/oauth_data_source.py)

&#96;&#96;&#96;

1import datetime


2import urllib.parse

3from typing import Any

4

&#96;&#96;&#96;

[langgenius/dify](https://github.com/langgenius/dify)[api/controllers/console/auth/data\_source\_oauth.py](https://github.com/langgenius/dify/blob/ef20f694/api/controllers/console/auth/data_source_oauth.py)

&#96;&#96;&#96;

16

17def get_oauth_providers():

18    with current_app.app_context():


19        notion_oauth &#61; NotionOAuth(


20            client_id&#61;dify_config.NOTION_CLIENT_ID or &quot;&quot;,

21            client_secret&#61;dify_config.NOTION_CLIENT_SECRET or &quot;&quot;,

22            redirect_uri&#61;dify_config.CONSOLE_API_URL + &quot;/console/api/oauth/data-source/callback/notion&quot;,

&#96;&#96;&#96;

[return to langgenius/dify](chrome-extension://ldmmifpegigmeammaeckplhnjbbpccmm/langgenius/dify)

如果我想使用Notion内部集成，还需要配置NOTION\_CLIENT\_ID和NOTION\_CLIENT\_SECRET吗？在.env文件中是否需要修改Notion集成类型为internal？另外，我的Dify服务可否设置为通过HTTP协议连接不添加ssl证书，还是不管Notion集成为内部或外部类型都必须添加证书？

Deep

Searched across langgenius/dify

Thought Process

Based on my analysis of the Dify codebase, here’s how the Notion integration works:

## Notion Integration Configuration

Dify supports two types of Notion integration configured through the &#96;NOTION_INTEGRATION_TYPE&#96; environment variable notion\_config.py:21-28 :

1. **Public Integration** (default): Uses OAuth flow with &#96;NOTION_CLIENT_ID&#96; and &#96;NOTION_CLIENT_SECRET&#96;

2. **Internal Integration**: Uses an internal secret token

The configuration variables are defined in the environment files .env.example:366-368 and .env.example:714-720 :

* &#96;NOTION_INTEGRATION_TYPE&#96;: Set to either “public” or “internal”

* &#96;NOTION_CLIENT_ID&#96;: Required for public integration type

* &#96;NOTION_CLIENT_SECRET&#96;: Required for public integration type

* &#96;NOTION_INTERNAL_SECRET&#96;: Required for internal integration type

The OAuth flow is implemented in the data source authentication controller data\_source\_oauth.py:19-38 , which handles the authentication process based on the configured integration type.

## HTTP vs HTTPS Configuration

Dify handles HTTP/HTTPS connections through Nginx as a reverse proxy. The HTTPS configuration is controlled by the &#96;NGINX_HTTPS_ENABLED&#96; environment variable .env.example:943 .

The system supports two SSL certificate approaches:

1. **Automated SSL with Certbot**: For Let’s Encrypt certificates

2. **Manual SSL certificates**: Using custom certificate files

The Nginx configuration is dynamically set up through the docker entrypoint script [docker-entrypoint.sh:4](http://docker-entrypoint.sh:4) , which detects the SSL configuration and applies the appropriate settings.

## SSL Certificate Requirements

**SSL certificates are NOT mandatory** for Dify to function. The application can run over HTTP without SSL certificates. The &#96;NGINX_HTTPS_ENABLED&#96; setting controls whether HTTPS is enabled, and when set to &#96;false&#96; (or not configured), the application will serve over HTTP.

The Notion integration type (internal vs external) does not affect SSL certificate requirements. Both integration types work regardless of whether the Dify service is running over HTTP or HTTPS.

## Notes

* The Notion integration is primarily used for importing documents from Notion workspaces into Dify’s RAG system

* The integration type choice depends on whether you want to use Notion’s public OAuth API or an internal integration token

* SSL/HTTPS configuration is handled entirely at the infrastructure level through Nginx and is independent of the Notion integration configuration

* For production deployments, HTTPS is recommended for security, but it’s not technically required for the application to function

Copy ResponseShare

[langgenius/dify](https://github.com/langgenius/dify)[api/configs/extra/notion\_config.py](https://github.com/langgenius/dify/blob/ef20f694/api/configs/extra/notion_config.py)

&#96;&#96;&#96;

18        description&#61;&quot;Client secret for Notion API authentication. Required for OAuth 2.0 flow.&quot;,

19        default&#61;None,

20    )


21

22    NOTION_INTEGRATION_TYPE: Optional[str] &#61; Field(

23        description&#61;&quot;Type of Notion integration.&quot;

24        &quot; Set to &#39;internal&#39; for internal integrations, or None for public integrations.&quot;,

25        default&#61;None,

26    )

27

28    NOTION_INTERNAL_SECRET: Optional[str] &#61; Field(


29        description&#61;&quot;Secret key for internal Notion integrations. Required when NOTION_INTEGRATION_TYPE is &#39;internal&#39;.&quot;,

30        default&#61;None,

31    )

&#96;&#96;&#96;

[langgenius/dify](https://github.com/langgenius/dify)[api/.env.example](https://github.com/langgenius/dify/blob/ef20f694/api/.env.example)

&#96;&#96;&#96;

363ENABLE_REQUEST_LOGGING&#61;False

364SQLALCHEMY_ECHO&#61;false

365


366# Notion import configuration, support public and internal

367NOTION_INTEGRATION_TYPE&#61;public

368NOTION_CLIENT_SECRET&#61;you-client-secret


369NOTION_CLIENT_ID&#61;you-client-id

370NOTION_INTERNAL_SECRET&#61;you-internal-secret

371

&#96;&#96;&#96;

[langgenius/dify](https://github.com/langgenius/dify)[docker/.env.example](https://github.com/langgenius/dify/blob/ef20f694/docker/.env.example)

&#96;&#96;&#96;

711

712# Configure as &quot;public&quot; or &quot;internal&quot;.

713# Since Notion&#39;s OAuth redirect URL only supports HTTPS,


714# if deploying locally, please use Notion&#39;s internal integration.

715NOTION_INTEGRATION_TYPE&#61;public

716# Notion OAuth client secret (used for public integration type)

717NOTION_CLIENT_SECRET&#61;

718# Notion OAuth client id (used for public integration type)

719NOTION_CLIENT_ID&#61;

720# Notion internal integration secret.


721# If the value of NOTION_INTEGRATION_TYPE is &quot;internal&quot;,

722# you need to configure this variable.

723NOTION_INTERNAL_SECRET&#61;


940# ------------------------------

941# Environment Variables for Nginx reverse proxy

942# ------------------------------


943NGINX_SERVER_NAME&#61;_


944NGINX_HTTPS_ENABLED&#61;false

945# HTTP port

946NGINX_PORT&#61;80

&#96;&#96;&#96;

[langgenius/dify](https://github.com/langgenius/dify)[api/controllers/console/auth/data\_source\_oauth.py](https://github.com/langgenius/dify/blob/ef20f694/api/controllers/console/auth/data_source_oauth.py)

&#96;&#96;&#96;

16

17def get_oauth_providers():

18    with current_app.app_context():


19        notion_oauth &#61; NotionOAuth(

20            client_id&#61;dify_config.NOTION_CLIENT_ID or &quot;&quot;,

21            client_secret&#61;dify_config.NOTION_CLIENT_SECRET or &quot;&quot;,

22            redirect_uri&#61;dify_config.CONSOLE_API_URL + &quot;/console/api/oauth/data-source/callback/notion&quot;,

23        )

24

25        OAUTH_PROVIDERS &#61; {&quot;notion&quot;: notion_oauth}

26        return OAUTH_PROVIDERS

27

28

29class OAuthDataSource(Resource):

30    def get(self, provider: str):

31        # The role of the current user in the table must be admin or owner

32        if not current_user.is_admin_or_owner:

33            raise Forbidden()

34        OAUTH_DATASOURCE_PROVIDERS &#61; get_oauth_providers()

35        with current_app.app_context():

36            oauth_provider &#61; OAUTH_DATASOURCE_PROVIDERS.get(provider)

37        if not oauth_provider:

38            return {&quot;error&quot;: &quot;Invalid provider&quot;}, 400


39        if dify_config.NOTION_INTEGRATION_TYPE &#61;&#61; &quot;internal&quot;:

40            internal_secret &#61; dify_config.NOTION_INTERNAL_SECRET

41            if not internal_secret:

&#96;&#96;&#96;

[langgenius/dify](https://github.com/langgenius/dify)[docker/nginx/docker-entrypoint.sh](https://github.com/langgenius/dify/blob/ef20f694/docker/nginx/docker-entrypoint.sh)

&#96;&#96;&#96;

1#!/bin/bash

2

3HTTPS_CONFIG&#61;&#39;&#39;


4 


5if [ &quot;${NGINX_HTTPS_ENABLED}&quot; &#61; &quot;true&quot; ]; then

6    # Check if the certificate and key files for the specified domain exist

7    if [ -n &quot;${CERTBOT_DOMAIN}&quot; ] &amp;&amp; \

&#96;&#96;&#96;

[return to langgenius/dify](chrome-extension://ldmmifpegigmeammaeckplhnjbbpccmm/langgenius/dify)

如果我只想使用内部类型的Notion集成，需要对上述所有部署文件中的Notion设置做哪些修改，添加什么、删掉什么？如何才能让系统不自动进行Notion Oauth验证、返回报错？如果我使用内部类型的Notion集成，是否应当在docker compose和所有部署文件中提前填入Notion\_Internal\_Secret？

Deep

Searched across langgenius/dify

Thought Process

Based on my analysis of the Dify codebase, here’s how Dify’s Notion integration works when &#96;NOTION_INTEGRATION_TYPE&#96; is set to ‘internal’:

## Configuration Setup

Dify supports two types of Notion integration through the &#96;NOTION_INTEGRATION_TYPE&#96; environment variable, which can be set to either “public” or “internal” .env.example:366 . When set to ‘internal’, the system also uses the &#96;NOTION_INTERNAL_SECRET&#96; environment variable .env.example:366 .

## Internal Integration Implementation

When &#96;NOTION_INTEGRATION_TYPE&#96; is configured as ‘internal’, Dify uses a different authentication flow that bypasses the standard OAuth process. The system implements this through:

1. **Direct Token Usage**: Instead of going through the OAuth authorization flow, the system uses the &#96;NOTION_INTERNAL_SECRET&#96; token directly to authenticate with Notion’s API.

2. **save\_internal\_access\_token Method**: The &#96;NotionOAuth&#96; class contains a &#96;save_internal_access_token&#96; method specifically designed for internal integration oauth\_data\_source.py:1 . This method handles the authentication and token storage for internal integrations.

3. **OAuth Bypass Logic**: The OAuth controller checks the integration type and routes the authentication flow accordingly data\_source\_oauth.py:38 .

## How OAuth Validation is Bypassed

The internal integration type bypasses OAuth validation by:

* **Skipping Authorization Flow**: Instead of redirecting users to Notion’s OAuth authorization page, the system directly uses the pre-configured internal secret token.

* **Direct API Access**: The &#96;NOTION_INTERNAL_SECRET&#96; serves as a pre-authorized token that allows direct access to Notion’s API without requiring user consent or redirect URLs.

* **Simplified Authentication**: This approach is particularly useful for local deployments where HTTPS redirect URLs required for OAuth might not be available.

## Configuration in Docker

The Docker deployment supports this configuration through environment variables passed to the containers docker-compose.yaml:315 and defined in the Docker environment file .env.example:714-720 .

## Notes

The internal integration type is designed to simplify Notion integration setup, especially for local or development environments where setting up OAuth with proper HTTPS callbacks might be challenging. The &#96;NOTION_INTERNAL_SECRET&#96; is essentially a Notion internal integration token that provides direct API access without requiring the standard OAuth flow. This approach trades the user authorization step for simplified configuration, making it suitable for trusted environments where all users should have access to the configured Notion workspace.

Copy ResponseShare

[langgenius/dify](https://github.com/langgenius/dify)[api/.env.example](https://github.com/langgenius/dify/blob/ef20f694/api/.env.example)

&#96;&#96;&#96;

363ENABLE_REQUEST_LOGGING&#61;False

364SQLALCHEMY_ECHO&#61;false

365


366# Notion import configuration, support public and internal


367NOTION_INTEGRATION_TYPE&#61;public

368NOTION_CLIENT_SECRET&#61;you-client-secret

369NOTION_CLIENT_ID&#61;you-client-id

&#96;&#96;&#96;

[langgenius/dify](https://github.com/langgenius/dify)[api/libs/oauth\_data\_source.py](https://github.com/langgenius/dify/blob/ef20f694/api/libs/oauth_data_source.py)

&#96;&#96;&#96;

1import datetime


2import urllib.parse

3from typing import Any

4

&#96;&#96;&#96;

[langgenius/dify](https://github.com/langgenius/dify)[api/controllers/console/auth/data\_source\_oauth.py](https://github.com/langgenius/dify/blob/ef20f694/api/controllers/console/auth/data_source_oauth.py)

&#96;&#96;&#96;

35        with current_app.app_context():

36            oauth_provider &#61; OAUTH_DATASOURCE_PROVIDERS.get(provider)

37        if not oauth_provider:


38            return {&quot;error&quot;: &quot;Invalid provider&quot;}, 400


39        if dify_config.NOTION_INTEGRATION_TYPE &#61;&#61; &quot;internal&quot;:

40            internal_secret &#61; dify_config.NOTION_INTERNAL_SECRET

41            if not internal_secret:

&#96;&#96;&#96;

[langgenius/dify](https://github.com/langgenius/dify)[docker/docker-compose.yaml](https://github.com/langgenius/dify/blob/ef20f694/docker/docker-compose.yaml)

&#96;&#96;&#96;

312  API_SENTRY_DSN: ${API_SENTRY_DSN:-}

313  API_SENTRY_TRACES_SAMPLE_RATE: ${API_SENTRY_TRACES_SAMPLE_RATE:-1.0}

314  API_SENTRY_PROFILES_SAMPLE_RATE: ${API_SENTRY_PROFILES_SAMPLE_RATE:-1.0}


315  WEB_SENTRY_DSN: ${WEB_SENTRY_DSN:-}


316  NOTION_INTEGRATION_TYPE: ${NOTION_INTEGRATION_TYPE:-public}

317  NOTION_CLIENT_SECRET: ${NOTION_CLIENT_SECRET:-}

318  NOTION_CLIENT_ID: ${NOTION_CLIENT_ID:-}

&#96;&#96;&#96;

[langgenius/dify](https://github.com/langgenius/dify)[docker/.env.example](https://github.com/langgenius/dify/blob/ef20f694/docker/.env.example)

&#96;&#96;&#96;

711

712# Configure as &quot;public&quot; or &quot;internal&quot;.

713# Since Notion&#39;s OAuth redirect URL only supports HTTPS,


714# if deploying locally, please use Notion&#39;s internal integration.

715NOTION_INTEGRATION_TYPE&#61;public

716# Notion OAuth client secret (used for public integration type)

717NOTION_CLIENT_SECRET&#61;

718# Notion OAuth client id (used for public integration type)

719NOTION_CLIENT_ID&#61;

720# Notion internal integration secret.


721# If the value of NOTION_INTEGRATION_TYPE is &quot;internal&quot;,

722# you need to configure this variable.

723NOTION_INTERNAL_SECRET&#61;

&#96;&#96;&#96;

[return to langgenius/dify](chrome-extension://ldmmifpegigmeammaeckplhnjbbpccmm/langgenius/dify)

所以我到底应该修改哪个文件里的哪一处？或是需要修改多个文件？

Deep

Searched across langgenius/dify

Thought Process

Based on my analysis of the Dify codebase, here’s how to configure Notion internal integration and how it prevents OAuth validation:

## Configuration in .env Files

To configure Notion internal integration, you need to modify the environment variables in your &#96;.env&#96; file. The configuration involves setting two key variables:

1. **NOTION\_INTEGRATION\_TYPE**: Set this to &#96;&#39;internal&#39;&#96; instead of the default &#96;&#39;public&#39;&#96;

2. **NOTION\_INTERNAL\_SECRET**: Set this to your Notion internal integration token

These environment variables are defined in the example configuration files .env.example:714-720 and .env.example:366 .

## Configuration in docker-compose.yaml

The docker-compose.yaml file passes these environment variables to the containers. The NOTION\_INTEGRATION\_TYPE variable is specifically configured in the environment section docker-compose.yaml:315 .

## Configuration Logic Implementation

The system reads these configuration values through the notion configuration module notion\_config.py:21-28 .

## How Internal Integration Prevents OAuth Validation

When &#96;NOTION_INTEGRATION_TYPE&#96; is set to &#96;&#39;internal&#39;&#96;, the system bypasses the standard OAuth validation flow. This is implemented in the data source OAuth controller where the system checks the integration type data\_source\_oauth.py:38 .

Instead of redirecting users through Notion’s OAuth authorization flow (which requires HTTPS and external callback URLs), the system directly uses the &#96;NOTION_INTERNAL_SECRET&#96; token for API authentication. This is particularly useful for local development environments where setting up proper OAuth callbacks can be challenging.

The OAuth data source implementation handles both public OAuth flow and internal token authentication, allowing the system to skip the entire OAuth validation process when using internal integration oauth\_data\_source.py:1 .

## Notes

This internal integration approach is specifically designed for development environments or scenarios where you have direct access to Notion’s internal integration tokens. It eliminates the need for OAuth callback URLs and the associated HTTPS requirements, making local development and testing significantly easier. The internal integration uses Notion’s Internal Integration tokens, which provide direct API access without requiring user consent flow.

Copy ResponseShare

[langgenius/dify](https://github.com/langgenius/dify)[docker/.env.example](https://github.com/langgenius/dify/blob/ef20f694/docker/.env.example)

&#96;&#96;&#96;

711

712# Configure as &quot;public&quot; or &quot;internal&quot;.

713# Since Notion&#39;s OAuth redirect URL only supports HTTPS,


714# if deploying locally, please use Notion&#39;s internal integration.

715NOTION_INTEGRATION_TYPE&#61;public

716# Notion OAuth client secret (used for public integration type)

717NOTION_CLIENT_SECRET&#61;

718# Notion OAuth client id (used for public integration type)

719NOTION_CLIENT_ID&#61;

720# Notion internal integration secret.


721# If the value of NOTION_INTEGRATION_TYPE is &quot;internal&quot;,

722# you need to configure this variable.

723NOTION_INTERNAL_SECRET&#61;

&#96;&#96;&#96;

[langgenius/dify](https://github.com/langgenius/dify)[api/.env.example](https://github.com/langgenius/dify/blob/ef20f694/api/.env.example)

&#96;&#96;&#96;

363ENABLE_REQUEST_LOGGING&#61;False

364SQLALCHEMY_ECHO&#61;false

365


366# Notion import configuration, support public and internal


367NOTION_INTEGRATION_TYPE&#61;public

368NOTION_CLIENT_SECRET&#61;you-client-secret

369NOTION_CLIENT_ID&#61;you-client-id

&#96;&#96;&#96;

[langgenius/dify](https://github.com/langgenius/dify)[docker/docker-compose.yaml](https://github.com/langgenius/dify/blob/ef20f694/docker/docker-compose.yaml)

&#96;&#96;&#96;

312  API_SENTRY_DSN: ${API_SENTRY_DSN:-}

313  API_SENTRY_TRACES_SAMPLE_RATE: ${API_SENTRY_TRACES_SAMPLE_RATE:-1.0}

314  API_SENTRY_PROFILES_SAMPLE_RATE: ${API_SENTRY_PROFILES_SAMPLE_RATE:-1.0}


315  WEB_SENTRY_DSN: ${WEB_SENTRY_DSN:-}


316  NOTION_INTEGRATION_TYPE: ${NOTION_INTEGRATION_TYPE:-public}

317  NOTION_CLIENT_SECRET: ${NOTION_CLIENT_SECRET:-}

318  NOTION_CLIENT_ID: ${NOTION_CLIENT_ID:-}

&#96;&#96;&#96;

[langgenius/dify](https://github.com/langgenius/dify)[api/configs/extra/notion\_config.py](https://github.com/langgenius/dify/blob/ef20f694/api/configs/extra/notion_config.py)

&#96;&#96;&#96;

18        description&#61;&quot;Client secret for Notion API authentication. Required for OAuth 2.0 flow.&quot;,

19        default&#61;None,

20    )


21

22    NOTION_INTEGRATION_TYPE: Optional[str] &#61; Field(

23        description&#61;&quot;Type of Notion integration.&quot;

24        &quot; Set to &#39;internal&#39; for internal integrations, or None for public integrations.&quot;,

25        default&#61;None,

26    )

27

28    NOTION_INTERNAL_SECRET: Optional[str] &#61; Field(


29        description&#61;&quot;Secret key for internal Notion integrations. Required when NOTION_INTEGRATION_TYPE is &#39;internal&#39;.&quot;,

30        default&#61;None,

31    )

&#96;&#96;&#96;

[langgenius/dify](https://github.com/langgenius/dify)[api/controllers/console/auth/data\_source\_oauth.py](https://github.com/langgenius/dify/blob/ef20f694/api/controllers/console/auth/data_source_oauth.py)

&#96;&#96;&#96;

35        with current_app.app_context():

36            oauth_provider &#61; OAUTH_DATASOURCE_PROVIDERS.get(provider)

37        if not oauth_provider:


38            return {&quot;error&quot;: &quot;Invalid provider&quot;}, 400


39        if dify_config.NOTION_INTEGRATION_TYPE &#61;&#61; &quot;internal&quot;:

40            internal_secret &#61; dify_config.NOTION_INTERNAL_SECRET

41            if not internal_secret:

&#96;&#96;&#96;

[langgenius/dify](https://github.com/langgenius/dify)[api/libs/oauth\_data\_source.py](https://github.com/langgenius/dify/blob/ef20f694/api/libs/oauth_data_source.py)

&#96;&#96;&#96;

1import datetime


2import urllib.parse

3from typing import Any

4

&#96;&#96;&#96;

[return to langgenius/dify](chrome-extension://ldmmifpegigmeammaeckplhnjbbpccmm/langgenius/dify)

告知我如何用修改后的文件在我的ubuntu云服务器上（docker相关程序已安装）通过docker compose重新部署这个项目，使我可以顺利导入Notion来源的内容（通过内部集成）到知识库，不再报错。列出每一步骤的详细操作，让我一个毫无编程基础的人也能顺利完成，越详细越好！

Deep

Searched across langgenius/dify

Thought Process

# How to Redeploy Docker Compose for Dify with Notion Internal Integration

Here’s a comprehensive guide for redeploying your Dify Docker Compose project on Ubuntu after modifying Notion integration configuration, designed for users with no programming background.

## Understanding Dify’s Configuration Structure

Dify uses a Docker Compose architecture with configuration managed through environment files. The system supports two types of Notion integration: “public” (OAuth-based) and “internal” (using internal integration tokens). .env.example:714-722

## Step-by-Step Redeployment Process

### Step 1: Access Your Server

1. Connect to your Ubuntu cloud server using SSH or your cloud provider’s console

2. Navigate to your Dify installation directory (usually where you initially installed Dify)

### Step 2: Locate and Modify Configuration Files

The main configuration files you need to modify are:

* &#96;docker/.env&#96; (your actual environment file, copied from &#96;docker/.env.example&#96;)

* Or if you haven’t created it yet, copy from &#96;docker/.env.example&#96; .env.example:707-722

### Step 3: Configure Notion Internal Integration

For Notion internal integration, you need to modify these specific environment variables:

1. **Set Integration Type to Internal:**

   &#96;&#96;&#96;

   NOTION_INTEGRATION_TYPE&#61;internal  

   &#96;&#96;&#96;

2. **Add Your Notion Internal Secret:**

   &#96;&#96;&#96;

   NOTION_INTERNAL_SECRET&#61;your_notion_internal_secret_here  

   &#96;&#96;&#96;

3. **Leave Public Integration Settings Empty (if switching from public to internal):**

   &#96;&#96;&#96;

   NOTION_CLIENT_ID&#61;  

   NOTION_CLIENT_SECRET&#61;  

   &#96;&#96;&#96;

.env.example:366-369

### Step 4: Save Configuration Changes

1. Save the &#96;.env&#96; file after making your changes

2. Ensure the file permissions are correct:

   &#96;&#96;&#96;

   chmod 644 docker/.env

   &#96;&#96;&#96;

### Step 5: Redeploy Using Docker Compose

The Docker Compose system orchestrates multiple services including the API, worker, web interface, database, and other components. docker-compose.yaml:315

**Execute these commands in order:**

1. **Stop all running services:**

   &#96;&#96;&#96;

   cd /path/to/your/dify/docker  

   docker-compose down

   &#96;&#96;&#96;

2. **Pull latest images (optional but recommended):**

   &#96;&#96;&#96;

   docker-compose pull

   &#96;&#96;&#96;

3. **Rebuild and start all services:**

   &#96;&#96;&#96;

   docker-compose up -d

   &#96;&#96;&#96;

4. **Verify deployment:**

   &#96;&#96;&#96;

   docker-compose ps

   &#96;&#96;&#96;

### Step 6: Monitor the Deployment

1. **Check service status:**

   &#96;&#96;&#96;

   docker-compose logs -f

   &#96;&#96;&#96;

2. **Check specific service logs if needed:**

   &#96;&#96;&#96;

   docker-compose logs -f api  

   docker-compose logs -f worker

   &#96;&#96;&#96;

3. **Verify web access:**

   * Open your browser and access your Dify instance

   * Test the Notion integration functionality

## Understanding Service Dependencies

Dify’s architecture includes multiple interconnected services that must start in the correct order. The system includes database services (PostgreSQL, Redis), application services (API, worker, web), and support services (nginx, vector database). docker-compose.yaml:532-570

## Common Troubleshooting Steps

### If Services Fail to Start:

1. **Check environment variables:**

   &#96;&#96;&#96;

   docker-compose config

   &#96;&#96;&#96;

2. **Restart specific services:**

   &#96;&#96;&#96;

   docker-compose restart api worker

   &#96;&#96;&#96;

3. **Check database connectivity:**

   &#96;&#96;&#96;

   docker-compose logs db redis

   &#96;&#96;&#96;

### If Notion Integration Doesn’t Work:

1. **Verify your Notion internal secret is correct**

2. **Check API service logs:**

   &#96;&#96;&#96;

   docker-compose logs api | grep -i notion

   &#96;&#96;&#96;

3. **Restart the API service:**

   &#96;&#96;&#96;

   docker-compose restart api

   &#96;&#96;&#96;

## Alternative Deployment Commands

If you encounter issues with the standard deployment:

1. **Force recreation of containers:**

   &#96;&#96;&#96;

   docker-compose up -d --force-recreate

   &#96;&#96;&#96;

2. **Rebuild containers from scratch:**

   &#96;&#96;&#96;

   docker-compose build --no-cache  

   docker-compose up -d

   &#96;&#96;&#96;

3. **Clean restart:**

   &#96;&#96;&#96;

   docker-compose down -v  

   docker-compose up -d

   &#96;&#96;&#96;

## Configuration Validation

The system validates configuration through multiple layers including environment variable processing and service health checks. **init**.py:18-49

## Security Considerations

* Ensure your &#96;.env&#96; file has proper permissions (not world-readable)

* Keep your Notion internal secret secure and don’t share it

* The system includes built-in security features like SSRF protection docker-compose.yaml:413-438

## Notes

* **Configuration Management**: Dify uses a hierarchical configuration system that processes environment variables through Docker Compose, then validates them at runtime using configuration classes.

* **Service Architecture**: The platform uses a microservices architecture where each component (API, worker, web, database) runs in separate containers, requiring careful orchestration during deployment.

* **Notion Integration Types**: The system supports both “public” (OAuth) and “internal” (token-based) Notion integrations. When switching between types, ensure you clear the unused configuration variables to avoid conflicts.

* **Deployment Dependencies**: Services have specific startup dependencies - databases must be ready before application services start, and the configuration system validates settings during container initialization.

* **Persistent Data**: The &#96;docker-compose down&#96; command preserves your data volumes by default. Only use &#96;docker-compose down -v&#96; if you want to completely reset the system and lose all data.

Copy ResponseShare

[langgenius/dify](https://github.com/langgenius/dify)[docker/.env.example](https://github.com/langgenius/dify/blob/ef20f694/docker/.env.example)

&#96;&#96;&#96;

704# If not set, Sentry error reporting will be disabled.

705WEB_SENTRY_DSN&#61;

706


707# ------------------------------

708# Notion Integration Configuration

709# Variables can be obtained by applying for Notion integration: https://www.notion.so/my-integrations

710# ------------------------------

711

712# Configure as &quot;public&quot; or &quot;internal&quot;.

713# Since Notion&#39;s OAuth redirect URL only supports HTTPS,

714# if deploying locally, please use Notion&#39;s internal integration.

715NOTION_INTEGRATION_TYPE&#61;public

716# Notion OAuth client secret (used for public integration type)

717NOTION_CLIENT_SECRET&#61;

718# Notion OAuth client id (used for public integration type)

719NOTION_CLIENT_ID&#61;

720# Notion internal integration secret.

721# If the value of NOTION_INTEGRATION_TYPE is &quot;internal&quot;,

722# you need to configure this variable.


723NOTION_INTERNAL_SECRET&#61;

724

725# ------------------------------

&#96;&#96;&#96;

[langgenius/dify](https://github.com/langgenius/dify)[api/.env.example](https://github.com/langgenius/dify/blob/ef20f694/api/.env.example)

&#96;&#96;&#96;

363ENABLE_REQUEST_LOGGING&#61;False

364SQLALCHEMY_ECHO&#61;false

365


366# Notion import configuration, support public and internal

367NOTION_INTEGRATION_TYPE&#61;public

368NOTION_CLIENT_SECRET&#61;you-client-secret

369NOTION_CLIENT_ID&#61;you-client-id


370NOTION_INTERNAL_SECRET&#61;you-internal-secret

371

372ETL_TYPE&#61;dify

&#96;&#96;&#96;

[langgenius/dify](https://github.com/langgenius/dify)[docker/docker-compose.yaml](https://github.com/langgenius/dify/blob/ef20f694/docker/docker-compose.yaml)

&#96;&#96;&#96;

312  API_SENTRY_DSN: ${API_SENTRY_DSN:-}

313  API_SENTRY_TRACES_SAMPLE_RATE: ${API_SENTRY_TRACES_SAMPLE_RATE:-1.0}

314  API_SENTRY_PROFILES_SAMPLE_RATE: ${API_SENTRY_PROFILES_SAMPLE_RATE:-1.0}


315  WEB_SENTRY_DSN: ${WEB_SENTRY_DSN:-}


316  NOTION_INTEGRATION_TYPE: ${NOTION_INTEGRATION_TYPE:-public}

317  NOTION_CLIENT_SECRET: ${NOTION_CLIENT_SECRET:-}

318  NOTION_CLIENT_ID: ${NOTION_CLIENT_ID:-}


410  OPENSEARCH_MEMLOCK_HARD: ${OPENSEARCH_MEMLOCK_HARD:--1}

411  OPENSEARCH_NOFILE_SOFT: ${OPENSEARCH_NOFILE_SOFT:-65536}

412  OPENSEARCH_NOFILE_HARD: ${OPENSEARCH_NOFILE_HARD:-65536}


413  NGINX_SERVER_NAME: ${NGINX_SERVER_NAME:-_}

414  NGINX_HTTPS_ENABLED: ${NGINX_HTTPS_ENABLED:-false}

415  NGINX_PORT: ${NGINX_PORT:-80}

416  NGINX_SSL_PORT: ${NGINX_SSL_PORT:-443}

417  NGINX_SSL_CERT_FILENAME: ${NGINX_SSL_CERT_FILENAME:-dify.crt}

418  NGINX_SSL_CERT_KEY_FILENAME: ${NGINX_SSL_CERT_KEY_FILENAME:-dify.key}

419  NGINX_SSL_PROTOCOLS: ${NGINX_SSL_PROTOCOLS:-TLSv1.1 TLSv1.2 TLSv1.3}

420  NGINX_WORKER_PROCESSES: ${NGINX_WORKER_PROCESSES:-auto}

421  NGINX_CLIENT_MAX_BODY_SIZE: ${NGINX_CLIENT_MAX_BODY_SIZE:-15M}

422  NGINX_KEEPALIVE_TIMEOUT: ${NGINX_KEEPALIVE_TIMEOUT:-65}

423  NGINX_PROXY_READ_TIMEOUT: ${NGINX_PROXY_READ_TIMEOUT:-3600s}

424  NGINX_PROXY_SEND_TIMEOUT: ${NGINX_PROXY_SEND_TIMEOUT:-3600s}

425  NGINX_ENABLE_CERTBOT_CHALLENGE: ${NGINX_ENABLE_CERTBOT_CHALLENGE:-false}

426  CERTBOT_EMAIL: ${CERTBOT_EMAIL:-your_email@example.com}

427  CERTBOT_DOMAIN: ${CERTBOT_DOMAIN:-your_domain.com}

428  CERTBOT_OPTIONS: ${CERTBOT_OPTIONS:-}

429  SSRF_HTTP_PORT: ${SSRF_HTTP_PORT:-3128}

430  SSRF_COREDUMP_DIR: ${SSRF_COREDUMP_DIR:-/var/spool/squid}

431  SSRF_REVERSE_PROXY_PORT: ${SSRF_REVERSE_PROXY_PORT:-8194}

432  SSRF_SANDBOX_HOST: ${SSRF_SANDBOX_HOST:-sandbox}

433  SSRF_DEFAULT_TIME_OUT: ${SSRF_DEFAULT_TIME_OUT:-5}

434  SSRF_DEFAULT_CONNECT_TIME_OUT: ${SSRF_DEFAULT_CONNECT_TIME_OUT:-5}

435  SSRF_DEFAULT_READ_TIME_OUT: ${SSRF_DEFAULT_READ_TIME_OUT:-5}

436  SSRF_DEFAULT_WRITE_TIME_OUT: ${SSRF_DEFAULT_WRITE_TIME_OUT:-5}

437  EXPOSE_NGINX_PORT: ${EXPOSE_NGINX_PORT:-80}

438  EXPOSE_NGINX_SSL_PORT: ${EXPOSE_NGINX_SSL_PORT:-443}


439  POSITION_TOOL_PINS: ${POSITION_TOOL_PINS:-}

440  POSITION_TOOL_INCLUDES: ${POSITION_TOOL_INCLUDES:-}

441  POSITION_TOOL_EXCLUDES: ${POSITION_TOOL_EXCLUDES:-}


529      PLUGIN_REMOTE_INSTALL_PORT: ${EXPOSE_PLUGIN_DEBUGGING_PORT:-5003}

530      PLUGIN_MAX_PACKAGE_SIZE: ${PLUGIN_MAX_PACKAGE_SIZE:-52428800}

531      INNER_API_KEY_FOR_PLUGIN: ${PLUGIN_DIFY_INNER_API_KEY:-QaHbTe77CtuXmsfyhR7+vRjI/+XbV1AaFy691iy+kGDv2Jvy0/eAh8Y1}


532    depends_on:

533      db:

534        condition: service_healthy

535      redis:

536        condition: service_started

537    volumes:

538      # Mount the storage directory to the container, for storing user files.

539      - ./volumes/app/storage:/app/api/storage

540    networks:

541      - ssrf_proxy_network

542      - default

543

544  # worker service

545  # The Celery worker for processing the queue.

546  worker:

547    image: langgenius/dify-api:1.4.3

548    restart: always

549    environment:

550      # Use the shared environment variables.

551      &lt;&lt;: *shared-api-worker-env

552      # Startup mode, &#39;worker&#39; starts the Celery worker for processing the queue.

553      MODE: worker

554      SENTRY_DSN: ${API_SENTRY_DSN:-}

555      SENTRY_TRACES_SAMPLE_RATE: ${API_SENTRY_TRACES_SAMPLE_RATE:-1.0}

556      SENTRY_PROFILES_SAMPLE_RATE: ${API_SENTRY_PROFILES_SAMPLE_RATE:-1.0}

557      PLUGIN_MAX_PACKAGE_SIZE: ${PLUGIN_MAX_PACKAGE_SIZE:-52428800}

558      INNER_API_KEY_FOR_PLUGIN: ${PLUGIN_DIFY_INNER_API_KEY:-QaHbTe77CtuXmsfyhR7+vRjI/+XbV1AaFy691iy+kGDv2Jvy0/eAh8Y1}

559    depends_on:

560      db:

561        condition: service_healthy

562      redis:

563        condition: service_started

564    volumes:

565      # Mount the storage directory to the container, for storing user files.

566      - ./volumes/app/storage:/app/api/storage

567    networks:

568      - ssrf_proxy_network

569      - default

570


571  # Frontend web application.

572  web:

573    image: langgenius/dify-web:1.4.3

&#96;&#96;&#96;

[langgenius/dify](https://github.com/langgenius/dify)[api/configs/feature/**init**.py](https://github.com/langgenius/dify/blob/ef20f694/api/configs/feature/__init__.py)

&#96;&#96;&#96;

15from .hosted_service import HostedServiceConfig

16

17


18class SecurityConfig(BaseSettings):

19    &quot;&quot;&quot;

20    Security-related configurations for the application

21    &quot;&quot;&quot;

22

23    SECRET_KEY: str &#61; Field(

24        description&#61;&quot;Secret key for secure session cookie signing.&quot;

25        &quot;Make sure you are changing this key for your deployment with a strong key.&quot;

26        &quot;Generate a strong key using &#96;openssl rand -base64 42&#96; or set via the &#96;SECRET_KEY&#96; environment variable.&quot;,

27        default&#61;&quot;&quot;,

28    )

29

30    RESET_PASSWORD_TOKEN_EXPIRY_MINUTES: PositiveInt &#61; Field(

31        description&#61;&quot;Duration in minutes for which a password reset token remains valid&quot;,

32        default&#61;5,

33    )

34

35    LOGIN_DISABLED: bool &#61; Field(

36        description&#61;&quot;Whether to disable login checks&quot;,

37        default&#61;False,

38    )

39

40    ADMIN_API_KEY_ENABLE: bool &#61; Field(

41        description&#61;&quot;Whether to enable admin api key for authentication&quot;,

42        default&#61;False,

43    )

44

45    ADMIN_API_KEY: Optional[str] &#61; Field(

46        description&#61;&quot;admin api key for authentication&quot;,

47        default&#61;None,

48    )

49


50

51class AppExecutionConfig(BaseSettings):

52    &quot;&quot;&quot;

&#96;&#96;&#96;

Ask a follow-up question

Deep Research

好的，Little Witch。这是您提供的PDF内容的Markdown格式版本。Kitty已为您保留了原文的全部文本和结构。

Dify DeepWiki中文版

问题:Notion集成报错“client\_id应为字符串或 undefined&quot;

用户反馈通过 Docker Compose 部署Dify后,在向知识库导入 Notion 内容时,无法跳转到 Notion 开发者页面,并出现如下错误:

{

“error”: “invalid\_request”,

“error\_description”: “query failed validation: query.client\_id should be a stri”,

“request\_id”: “8cd9fc37-6712-49e7-b8b1-9abf7511b1da”

}

[cite\_start]分析: 根据错误信息,问题出在Notion 集成的 client\_id 配置上。错误提示 client\_id should be a string or undefined, instead was 0,表明 client\_id 被设置成了数字0,而不是预期的字符串。这通常是由于在 Docker Compose 部署时未正确配置 NOTION\_CLIENT\_ID 环境变量导致的。在Dify 的配置中,Notion 集成需要有效的客户端ID来执行 OAuth 认证。

解决方案:正确配置 Notion 集成的环境变量

要解决此问题,需要在Docker 部署配置中正确设置 Notion 集成的环境变量。以下是详细的步骤说明:

* [cite\_start]检查环境变量配置: Dify 在Docker 部署中使用 NOTION\_CLIENT\_ID 环境变量来配置 Notion 集成。请确保您的部署环境(如.env 文件或 Docker Compose 配置)中包含此变量。

* [cite\_start]获取 Notion Client ID: 您需要先在 Notion 开发者页面创建一个集成应用,以获取真实的Client ID,而不能使用默认的占位符值。操作步骤如下:

  * 访问 [[notion.so](http://notion.so)],登录您的Notion 账户。

  * 点击「Create new integration」创建新的集成应用。

  * 填写应用名称并选择关联的工作区,然后提交创建。

  * 创建成功后,您将看到该集成的 Internal Integration Token(内部集成令牌),以及用于公共 OAuth 集成的Client ID 和 Client Secret。

* [cite\_start]配置 Docker 环境变量: 在您的Docker Compose 配置或.env文件中,确保将 NOTION\_CLIENT\_ID 设置为从 Notion 获取的字符串值,而不是数字0[cite\_start]。同时,如果使用公共集成类型,还需要配置 NOTION\_CLIENT\_SECRET;如果使用内部集成类型,则需要配置 NOTION\_INTERNAL\_SECRET。

* [cite\_start]重启服务: 修改环境变量后,需要重新启动 Docker Compose 服务使配置生效。运行 docker-compose down 停止服务,然后 docker-compose up -d 重新启动容器。

[cite\_start]完成以上步骤后,Notion 集成应该能正常工作。如果仍遇到问题,请检查.env或Docker Compose 文件,确认 NOTION\_CLIENT\_ID 已正确设置为从 Notion 开发者页面获取的字符串值。

配置要求与注意事项

* [cite\_start]Notion 集成类型: Dify 支持两种 Notion 集成方式,可通过环境变量 NOTION\_INTEGRATION\_TYPE 配置:

  * [cite\_start]公共集成(Public Integration): 默认方式,使用OAuth 流程,需要配置 NOTION\_CLIENT\_ID 和 NOTION\_CLIENT\_SECRET。

  * [cite\_start]内部集成(Internal Integration): 使用内部集成令牌,需要配置 NOTION\_INTERNAL\_SECRET。

* [cite\_start]相关环境变量在示例配置文件中均有定义(如.env.example)。选择集成类型时,请根据需要填写对应的变量,并留空其他类型的变量以避免冲突。

* [cite\_start]OAuth 认证实现: Notion 集成的OAuth认证由 NotionOAuth 类实现,该类在初始化时需要有效的字符串类型 client\_id 参数。因此,确保 NOTION\_CLIENT\_ID 为字符串类型且非空非常重要。

* [cite\_start]HTTPS 要求: Notion 的OAuth 重定向 URL 仅支持HTTPS。如果您是在本地部署或无法提供 HTTPS回调,建议使用内部集成类型,以避免OAuth 流程中的HTTPS限制。

* [cite\_start]SSL证书: SSL证书并非 Dify 运行的强制要求,应用可以在没有SSL的情况下通过HTTP运行。HTTPS的启用由 NGINX\_HTTPS\_ENABLED 设置控制,设置为 false (或未配置)时,应用将通过 HTTP 提供服务[cite\_start]。无论Notion 集成类型是内部还是外部,都不会影响SSL证书的要求 两种集成类型在HTTP或HTTPS环境下均可工作。不过,在生产环境中,出于安全考虑,仍建议启用HTTPS。

* [cite\_start]内部集成的优势: 内部集成类型旨在简化集成的设置,尤其适用于本地或开发环境,因为在这些环境中配置 OAuth 的HTTPS回调可能较为困难[cite\_start]。 NOTION\_INTERNAL\_SECRET 本质上是一个 Notion 内部集成令牌,可直接用于API访问,无需经过标准的 OAuth 用户授权流程[cite\_start]。这种方式省去了用户授权步骤,配置更为简便,适合在所有用户都应访问已配置 Notion 工作区的受信环境中使用。

部署文件修改指导

如果您希望使用 Notion 内部集成,需要对部署配置文件进行相应修改。以下是具体步骤:

* [cite\_start]修改环境变量: 在您的.env文件中,将 NOTION\_INTEGRATION\_TYPE 由默认的 public 改为internal,并填入您的Notion 内部集成令牌到 NOTION\_INTERNAL\_SECRET[cite\_start]。同时,留空 NOTION\_CLIENT\_ID 和 NOTION\_CLIENT\_SECRET (如果之前配置过公共集成的话),以确保不会残留冲突的配置。示例配置片段如下:

  NOTION\_INTEGRATION\_TYPE&#61;internal

NOTION\_INTERNAL\_SECRET&#61;your\_notion\_internal\_secret\_here

NOTION\_CLIENT\_ID&#61;

NOTION\_CLIENT\_SECRET&#61;

* [cite\_start]确保 Docker Compose 传递变量: 确认 docker-compose.yaml 文件中已正确配置环境变量传递。通常,Dify 的Docker Compose 已经从环境文件中读取这些变量,但请检查相关部分(例如 environment 部分)是否包含 NOTION\_INTEGRATION\_TYPE、NOTION\_INTERNAL\_SECRET 等变量的引用,确保其值会从您的.env文件中获取。

* 重启服务使更改生效: 使用docker-compose down 停止当前运行的容器,然后 docker-compose up -d 重新启动服务,让新的配置生效。

[cite\_start]通过以上修改,Dify将使用内部集成方式连接 Notion,跳过 OAuth 验证流程,直接使用 NOTION\_INTERNAL\_SECRET 进行认证。这将避免因 OAuth 回调需要 HTTPS而导致的问题,使本地部署也能顺利导入 Notion 内容。

Ubuntu 云服务器 Docker Compose 重新部署指南

以下步骤指导您在Ubuntu 云服务器上通过 Docker Compose 重新部署Dify,以使用 Notion 内部集成并解决导入错误。本指南假设您已在服务器上安装好 Docker 和 Docker Compose,且无编程基础也能按照步骤操作。

* 访问服务器: 使用SSH连接到您的Ubuntu 云服务器(或通过云厂商提供的控制台登录服务器)。

* 进入 Dify 项目目录: 切换到您最初部署 Dify的目录(通常是克隆的 dify 仓库或存放 docker-compose.yml 的目录)。

* 定位并编辑配置文件: 找到并修改Dify的环境配置文件:

  * 如果您之前已经创建了 docker/.env 文件,请直接编辑它;

  * 如果尚未创建,请从示例文件复制一份: cp docker/.env.example docker/.env,然后编辑新生成的 docker/.env文件。

* 配置 Notion 内部集成: 在打开的.env文件中,找到Notion 相关配置部分,进行如下修改:

  * 将 NOTION\_INTEGRATION\_TYPE 设置为 internal (移除前面的注释符号 # 并修改值)。

  * 将 NOTION\_INTERNAL\_SECRET 设置为您从 Notion 获取的内部集成令牌(替换 your\_notion\_internal\_secret\_here)。

  * 确保 NOTION\_CLIENT\_ID 和 NOTION\_CLIENT\_SECRET 留空(如果之前有值,建议注释掉或删除,以避免干扰)。

* 修改后的示例如下(请根据实际情况替换令牌):

  NOTION\_INTEGRATION\_TYPE&#61;internal

NOTION\_INTERNAL\_SECRET&#61;secret\_XXXXXXXXXXXXXXXXXXXXXXXX

# NOTION\_CLIENT\_ID&#61;

# NOTION\_CLIENT\_SECRET&#61;

* 保存配置更改: 保存并关闭.env文件。确认文件权限正确(通常.env 文件应为用户可读,可使用 chmod 644 docker/.env 设置适当权限)。

* 使用Docker Compose 重新部署: 在终端中执行以下命令,按顺序操作:

  * 停止当前运行的服务:

    cd /path/to/your/dify/docker

docker-compose down

&#96;&#96;&#96;
 (请将/path/to/your/dify/docker 替换为实际的 docker 目录路径。)
&#96;&#96;&#96;

* 拉取最新镜像(可选但推荐):

  docker-compose pull

  此步骤将获取 Dify 各组件的最新Docker镜像(如果您希望使用最新版本)。

* 重建并启动服务:

  docker-compose up -d

  这将根据更新后的配置启动所有容器。-d表示在后台运行。

* 验证部署:

  docker-compose ps

  运行此命令检查各服务的状态,应显示所有容器处于 Up 状态。

* 监控部署和日志:

  * 检查服务日志以确保一切正常启动:

    docker-compose logs -f

    [cite\_start]使用 -f 参数可以实时查看日志输出,确认没有报错信息。如果需要查看特定服务的日志,可以指定服务名,例如 docker-compose logs -f api 或 docker-compose logs -f worker。

  * 等待片刻后,尝试通过浏览器访问您的Dify 实例,确认界面可以正常加载。

  * 测试 Notion 集成功能:在Dify 控制台中尝试从 Notion 导入内容,验证是否不再出现之前的错误。

至此,您已成功在Ubuntu 服务器上重新部署 Dify 并启用了 Notion 内部集成。现在应该可以顺利地将 Notion 内容导入知识库而不会遇到 client\_id 相关的错误了。

常见问题排查

如果在重新部署或使用过程中遇到问题,可以参考以下常见排查步骤:

* 服务无法启动:

  * [cite\_start]检查环境变量:运行 docker-compose config 查看最终应用的配置,确认所有环境变量已正确加载且无语法错误。

  * 重启特定服务:如果某个服务启动失败,可以尝试仅重启相关服务。例如:

    docker-compose restart api worker

    [cite\_start]这将重启 API 服务和后台任务 Worker 服务。

  * 检查数据库连接: Dify 依赖 PostgreSQL 和 Redis 等数据库服务。如果应用服务无法启动,可能是数据库未就绪。请查看数据库日志:

    docker-compose logs db redis

    [cite\_start]确保数据库容器正常运行且没有连接错误。

* Notion 集成仍无法工作:

  * 确认 Notion 内部令牌正确:检查您在 NOTION\_INTERNAL\_SECRET 中配置的令牌是否准确无误,没有多余的空格或拼写错误。

  * 查看 API 日志中的 Notion 相关信息:运行以下命令过滤出与Notion 相关的日志:

    docker-compose logs api | grep -i notion

    [cite\_start]这可能会显示集成过程中出现的具体错误或调试信息,帮助定位问题。

  * 重启API 服务:有时配置更改后,重启API 服务可以确保新配置生效:

    docker-compose restart api

    然后再次尝试导入 Notion 内容。

* 其他部署问题:

  * 强制重建容器:如果更新配置后容器未应用更改,可以尝试强制重新创建容器:

    docker-compose up -d --force-recreate

  * 彻底重建镜像:如果怀疑镜像有问题,可以尝试重新构建镜像(不使用缓存)然后启动:

    docker-compose build --no-cache

docker-compose up -d

* 清理并重试:在极端情况下(例如数据损坏),可以删除容器和卷并重新开始。但请注意,这会删除所有本地数据,谨慎使用:

  docker-compose down -v

docker-compose up -d

通过以上步骤,大多数常见问题应该能够得到解决。如果仍有无法解决的问题,建议查阅Dify的官方文档或社区支持,提供详细的错误日志以便进一步排查。

Dify 架构概述

Dify 采用模块化的微服务架构,通过 Docker Compose 编排多个容器化服务协同工作。其主要组件及其功能如下:

* 数据库服务: 包括PostgreSQL(关系型数据库,用于存储应用数据)和Redis(内存数据库,用于缓存和任务队列)。这些服务为Dify的核心功能提供数据存储和高速缓存支持。

* 应用服务:

  * api: Dify的后端API服务,提供核心业务逻辑和接口,处理来自前端和其他服务的请求。

  * worker: 后台任务 Worker 服务,基于Celery,用于异步处理耗时任务(如文档导入、数据处理等)。

  * web: Dify的前端 Web界面服务,提供用户操作的可视化界面。

* 支持服务:

  * nginx: 反向代理服务器,负责接收客户端请求并路由到内部服务,同时提供静态文件服务和 HTTPS 支持(可根据配置启用SSL)。

  * vectordb (如果使用): 向量数据库服务(如Milvus等),用于存储和检索文档向量嵌入,以支持基于向量的检索和问答功能。

[cite\_start]Dify 各组件之间有明确的依赖关系,例如应用服务在启动前需要确保数据库服务已就绪。Docker Compose 配置中通过 depends\_on 和健康检查来保证服务按正确顺序启动。了解这些架构知识有助于更好地理解部署和排错过程。

安全与配置验证

Dify 在配置和运行时内置了一些安全机制和验证措施,以保障系统稳定和数据安全:

* [cite\_start]配置校验: 系统在启动时会对关键配置进行校验。例如, NOTION\_CLIENT\_ID 若用于 OAuth,必须为字符串类型且非空,否则会导致初始化失败,从而避免无效配置被应用。如果环境变量配置错误(如本问题中的数字0),系统会通过错误信息提示具体原因,帮助您及时发现并修正配置问题。

* [cite\_start]权限与保密: 请确保您的.env 文件设置了适当的权限,不要将其设为公共可读,以防止敏感信息泄露[cite\_start]。Notion 的集成令牌和 OAuth 密钥等敏感信息切勿外泄。Dify 本身也提供了一些安全特性,例如内置的SSRF 防护机制,用于防止服务器端请求伪造等安全风险。

* [cite\_start]日志与监控: 建议在生产环境中启用Dify的日志记录和监控功能。例如,可以配置 Sentry 等服务来捕获应用错误和性能数据(Dify的环境变量中提供了 API\_SENTRY\_DSN 等用于集成 Sentry)。通过监控日志,您可以及时发现异常并进行故障排查。

通过遵循正确的配置步骤并留意上述安全事项,您将能够稳定、安全地运行Dify,并充分利用其与 Notion 等数据源的集成能力,构建强大的知识库和问答系统。如果您在使用过程中还有其他问题,欢迎查阅 Dify 的官方文档或向社区寻求帮助。祝您使用愉快!
