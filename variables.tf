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

# Create flags

variable "create_api_keys" {
  type        = bool
  default     = false
  description = "If true, api keys are created."
}

variable "create_webhooks" {
  type        = bool
  default     = false
  description = "If true, webhooks are created."
}

# Resources as a json/yaml

variable "resources" {
  type = object({

    auth = optional(object({
      apiKeys = optional(list(object({
        provider = optional(string)
        name = string
        services = list(object({
          name = string
        }))
      })))
    }))

    integration = optional(object({
      webhooks = optional(list(object({
        name = string
        provider = optional(string)
        url = string
        options = optional(object({
          hostname: optional(string)
          spamCheck: optional(bool)
          sendRaw: optional(bool)
        }))
      })))
    }))

  })
  description = "Resources as JSON (see README.md). You can read values from a YAML file with yamldecode()."
}
