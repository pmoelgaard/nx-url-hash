extend = require('extend')
crypto = require('crypto')

class URLHash

  constructor: (options) ->
    this.options = extend({}, options, {
      key: 'abcdeg'
      algorithm: 'sha1'
      encoding: 'hex'
    })

  hash: (url) =>

    options = this.options

    hashProvider = crypto.createHmac(options.algorithm, options.key)
    hashProvider.setEncoding(options.encoding)

    hashProvider.write(url)
    hashProvider.end()

    hash = hashProvider.read()
    return hash


module.exports = URLHash