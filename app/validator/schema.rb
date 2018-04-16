# frozen_string_literal: true

module Schema
  VALID_REQUEST_SCHEMA = {
    'type': 'object',
    'required': ['url'],
    'properties': {
      'url': {
        'type': 'String'
      },
      'ignore-main-redirect': {
        'type': 'boolean',
        'default': false
      },
      'detection-mode': {
        'type': 'string',
        'enum': %w[mixed passive aggressive]
      },
      'scope': {
        'type': 'string'
      },
      'user-agent': {
        'type': 'string'
      },
      'headers': {
        'type': 'string'
      },
      'vhost': {
        'type': 'string'
      },
      'random-user-agent': {
        'type': 'boolean',
        'default': false
      },
      'http-auth': {
        'type': 'string'
      },
      'max-threads': {
        'type': 'number'
      },
      'throttle': {
        'type': 'number'
      },
      'request-timeout': {
        'type': 'number',
        'default': 60
      },
      'connect-timeout': {
        'type': 'number',
        'default': 30
      },
      'proxy': {
        'type': 'string'
      },
      'proxy-auth': {
        'type': 'string'
      },
      'cookie-string': {
        'type': 'string'
      },
      'cache-ttl': {
        'type': 'number',
        'default': 600
      },
      'clear-cache': {
        'type': 'boolean',
        'default': false
      },
      'server': {
        'type': 'string',
        'enum': %w[apache iis nginx]
      },
      'force': {
        'type': 'boolean',
        'default': false
      },
      'wp-content-dir': {
        'type': 'string'
      },
      'wp-plugins-dir': {
        'type': 'string'
      },
      'interesting-findings-detection': {
        'type': 'string',
        'enum': %w[mixed passive aggressive]
      },
      'wp-version-all': {
        'type': 'boolean',
        'default': false
      },
      'wp-version-detection': {
        'type': 'string',
        'enum': %w[mixed passive aggressive]
      },
      'main-theme-detection': {
        'type': 'string',
        'enum': %w[mixed passive aggressive]
      },
      'enumerate': {
        'type': 'string',
        'enum': %w[vp ap p vt at t tt cb u m]
      },
      'plugins-list': {
        'type': 'string'
      },
      'plugins-detection': {
        'type': 'string',
        'enum': %w[mixed passive aggressive]
      },
      'plugins-version-all': {
        type: 'boolean',
        'default': false
      },
      'plugins-version-detection': {
        'type': 'string',
        'enum': %w[mixed passive aggressive]
      },
      'themes-list': {
        'type': 'string'
      },
      'themes-detection': {
        'type': 'string',
        'enum': %w[mixed passive aggressive]
      },
      'themes-version-all': {
        type: 'boolean',
        'default': false
      },
      'themes-version-detection': {
        'type': 'string',
        'enum': %w[mixed passive aggressive]
      },
      'timthumbs-detection': {
        'type': 'string',
        'enum': %w[mixed passive aggressive]
      },
      'config-backups-detection': {
        'type': 'string',
        'enum': %w[mixed passive aggressive]
      },
      'medias-detection': {
        'type': 'string',
        'enum': %w[mixed passive aggressive]
      },
      'users-list': {
        'type': 'string'
      },
      'users-detection': {
        'type': 'string',
        'enum': %w[mixed passive aggressive]
      }
    }
  }.freeze
end
