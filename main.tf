/**
 * Copyright 2022 Taito United
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

locals {

  apiKeysById = {
    for apiKey in coalesce(var.resources.apiKeys, []):
    "${apiKey.name}-${apiKey.provider}" => apiKey
    if var.create_api_keys && apiKey.provider == "sendgrid"
  }

  webhooksById = {
    for webhook in coalesce(var.resources.webhooks, []):
    "${webhook.name}-${webhook.provider}" => webhook
    if var.create_webhooks && webhook.provider == "sendgrid"
  }

}
