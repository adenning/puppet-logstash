# == Define: logstash::input::amqp
#
#   Pull events from an AMQP exchange.   NOTE: THIS IS ONLY KNOWN TO WORK
#   WITH RECENT RELEASES OF RABBITMQ. Any other amqp broker will not work
#   with this plugin. I do not know why. If you need support for brokers
#   other than rabbitmq, please file bugs here:
#   https://github.com/ruby-amqp/bunny   The default settings will create
#   an entirely transient queue and listen for all messages by default. If
#   you need durability or any other advanced settings, please set the
#   appropriate options
#
#
# === Parameters
#
# [*ack*]
#   Enable message acknowledgement
#   Value type is boolean
#   Default value: true
#   This variable is optional
#
# [*add_field*]
#   Add a field to an event
#   Value type is hash
#   Default value: {}
#   This variable is optional
#
# [*arguments*]
#   Your amqp broker's custom arguments. For mirrored queues in RabbitMQ:
#   [ "x-ha-policy", "all" ]
#   Value type is array
#   Default value: []
#   This variable is optional
#
# [*auto_delete*]
#   Should the queue be deleted on the broker when the last consumer
#   disconnects? Set this option to 'false' if you want the queue to
#   remain on the broker, queueing up messages until a consumer comes
#   along to consume them.
#   Value type is boolean
#   Default value: true
#   This variable is optional
#
# [*charset*]
#   The character encoding used in this input. Examples include "UTF-8"
#   and "cp1252"  This setting is useful if your log files are in Latin-1
#   (aka cp1252) or in another character set other than UTF-8.  This only
#   affects "plain" format logs since json is UTF-8 already.
#   Value can be any of: "ASCII-8BIT", "UTF-8", "US-ASCII", "Big5",
#   "Big5-HKSCS", "Big5-UAO", "CP949", "Emacs-Mule", "EUC-JP", "EUC-KR",
#   "EUC-TW", "GB18030", "GBK", "ISO-8859-1", "ISO-8859-2", "ISO-8859-3",
#   "ISO-8859-4", "ISO-8859-5", "ISO-8859-6", "ISO-8859-7", "ISO-8859-8",
#   "ISO-8859-9", "ISO-8859-10", "ISO-8859-11", "ISO-8859-13",
#   "ISO-8859-14", "ISO-8859-15", "ISO-8859-16", "KOI8-R", "KOI8-U",
#   "Shift_JIS", "UTF-16BE", "UTF-16LE", "UTF-32BE", "UTF-32LE",
#   "Windows-1251", "BINARY", "IBM437", "CP437", "IBM737", "CP737",
#   "IBM775", "CP775", "CP850", "IBM850", "IBM852", "CP852", "IBM855",
#   "CP855", "IBM857", "CP857", "IBM860", "CP860", "IBM861", "CP861",
#   "IBM862", "CP862", "IBM863", "CP863", "IBM864", "CP864", "IBM865",
#   "CP865", "IBM866", "CP866", "IBM869", "CP869", "Windows-1258",
#   "CP1258", "GB1988", "macCentEuro", "macCroatian", "macCyrillic",
#   "macGreek", "macIceland", "macRoman", "macRomania", "macThai",
#   "macTurkish", "macUkraine", "CP950", "Big5-HKSCS:2008", "CP951",
#   "stateless-ISO-2022-JP", "eucJP", "eucJP-ms", "euc-jp-ms", "CP51932",
#   "eucKR", "eucTW", "GB2312", "EUC-CN", "eucCN", "GB12345", "CP936",
#   "ISO-2022-JP", "ISO2022-JP", "ISO-2022-JP-2", "ISO2022-JP2",
#   "CP50220", "CP50221", "ISO8859-1", "Windows-1252", "CP1252",
#   "ISO8859-2", "Windows-1250", "CP1250", "ISO8859-3", "ISO8859-4",
#   "ISO8859-5", "ISO8859-6", "Windows-1256", "CP1256", "ISO8859-7",
#   "Windows-1253", "CP1253", "ISO8859-8", "Windows-1255", "CP1255",
#   "ISO8859-9", "Windows-1254", "CP1254", "ISO8859-10", "ISO8859-11",
#   "TIS-620", "Windows-874", "CP874", "ISO8859-13", "Windows-1257",
#   "CP1257", "ISO8859-14", "ISO8859-15", "ISO8859-16", "CP878",
#   "Windows-31J", "CP932", "csWindows31J", "SJIS", "PCK", "MacJapanese",
#   "MacJapan", "ASCII", "ANSI_X3.4-1968", "646", "UTF-7", "CP65000",
#   "CP65001", "UTF8-MAC", "UTF-8-MAC", "UTF-8-HFS", "UTF-16", "UTF-32",
#   "UCS-2BE", "UCS-4BE", "UCS-4LE", "CP1251", "UTF8-DoCoMo",
#   "SJIS-DoCoMo", "UTF8-KDDI", "SJIS-KDDI", "ISO-2022-JP-KDDI",
#   "stateless-ISO-2022-JP-KDDI", "UTF8-SoftBank", "SJIS-SoftBank",
#   "locale", "external", "filesystem", "internal"
#   Default value: "UTF-8"
#   This variable is optional
#
# [*debug*]
#   Enable or disable debugging
#   Value type is boolean
#   Default value: false
#   This variable is optional
#
# [*durable*]
#   Is this queue durable? (aka; Should it survive a broker restart?)
#   Value type is boolean
#   Default value: false
#   This variable is optional
#
# [*exchange*]
#   The name of the exchange to bind the queue. This is analogous to the
#   'amqp output' config 'name'
#   Value type is string
#   Default value: None
#   This variable is required
#
# [*exclusive*]
#   Is the queue exclusive? (aka: Will other clients connect to this named
#   queue?)
#   Value type is boolean
#   Default value: true
#   This variable is optional
#
# [*format*]
#   The format of input data (plain, json, json_event)
#   Value can be any of: "plain", "json", "json_event"
#   Default value: None
#   This variable is optional
#
# [*host*]
#   Your amqp server address
#   Value type is string
#   Default value: None
#   This variable is required
#
# [*key*]
#   The routing key to use. This is only valid for direct or fanout
#   exchanges  Routing keys are ignored on topic exchanges. Wildcards are
#   not valid on direct exchanges.
#   Value type is string
#   Default value: "logstash"
#   This variable is optional
#
# [*message_format*]
#   If format is "json", an event sprintf string to build what the display
#   @message should be given (defaults to the raw JSON). sprintf format
#   strings look like %{fieldname} or %{@metadata}.  If format is
#   "json_event", ALL fields except for @type are expected to be present.
#   Not receiving all fields will cause unexpected results.
#   Value type is string
#   Default value: None
#   This variable is optional
#
# [*passive*]
#   Passive queue creation? Useful for checking queue existance without
#   modifying server state
#   Value type is boolean
#   Default value: false
#   This variable is optional
#
# [*password*]
#   Your amqp password
#   Value type is password
#   Default value: "guest"
#   This variable is optional
#
# [*port*]
#   The AMQP port to connect on
#   Value type is number
#   Default value: 5672
#   This variable is optional
#
# [*prefetch_count*]
#   Prefetch count. Number of messages to prefetch
#   Value type is number
#   Default value: 1
#   This variable is optional
#
# [*queue*]
#   The name of the queue.
#   Value type is string
#   Default value: ""
#   This variable is optional
#
# [*ssl*]
#   Enable or disable SSL
#   Value type is boolean
#   Default value: false
#   This variable is optional
#
# [*tags*]
#   Add any number of arbitrary tags to your event.  This can help with
#   processing later.
#   Value type is array
#   Default value: None
#   This variable is optional
#
# [*threads*]
#   Set this to the number of threads you want this input to spawn. This
#   is the same as declaring the input multiple times
#   Value type is number
#   Default value: 1
#   This variable is optional
#
# [*type*]
#   Label this input with a type. Types are used mainly for filter
#   activation.  If you create an input with type "foobar", then only
#   filters which also have type "foobar" will act on them.  The type is
#   also stored as part of the event itself, so you can also use the type
#   to search for in the web interface.
#   Value type is string
#   Default value: None
#   This variable is required
#
# [*user*]
#   Your amqp username
#   Value type is string
#   Default value: "guest"
#   This variable is optional
#
# [*verify_ssl*]
#   Validate SSL certificate
#   Value type is boolean
#   Default value: false
#   This variable is optional
#
# [*vhost*]
#   The vhost to use. If you don't know what this is, leave the default.
#   Value type is string
#   Default value: "/"
#   This variable is optional
#
#
# [*instances*]
#   Array of instance names to which this define is.
#   Value type is array
#   Default value: [ 'array' ]
#   This variable is optional
#
#
# === Examples
#
#
#
#
# === Extra information
#
#  This define is created based on LogStash version 1.1.9
#  Extra information about this input can be found at:
#  http://logstash.net/docs/1.1.9/inputs/amqp
#
#  Need help? http://logstash.net/docs/1.1.9/learn
#
# === Authors
#
# * Richard Pijnenburg <mailto:richard@ispavailability.com>
#
define logstash::input::amqp (
  $exchange,
  $type,
  $host,
  $charset        = '',
  $debug          = '',
  $durable        = '',
  $ack            = '',
  $exclusive      = '',
  $format         = '',
  $arguments      = '',
  $key            = '',
  $message_format = '',
  $auto_delete    = '',
  $passive        = '',
  $password       = '',
  $port           = '',
  $prefetch_count = '',
  $queue          = '',
  $ssl            = '',
  $tags           = '',
  $threads        = '',
  $add_field      = '',
  $user           = '',
  $verify_ssl     = '',
  $vhost          = '',
  $instances      = [ 'agent' ]
) {

  require logstash::params

  #### Validate parameters

  validate_array($instances)

  if $tags {
    validate_array($tags)
    $arr_tags = join($tags, '\', \'')
    $opt_tags = "  tags => ['${arr_tags}']\n"
  }

  if $arguments {
    validate_array($arguments)
    $arr_arguments = join($arguments, '\', \'')
    $opt_arguments = "  arguments => ['${arr_arguments}']\n"
  }

  if $debug {
    validate_bool($debug)
    $opt_debug = "  debug => ${debug}\n"
  }

  if $verify_ssl {
    validate_bool($verify_ssl)
    $opt_verify_ssl = "  verify_ssl => ${verify_ssl}\n"
  }

  if $auto_delete {
    validate_bool($auto_delete)
    $opt_auto_delete = "  auto_delete => ${auto_delete}\n"
  }

  if $durable {
    validate_bool($durable)
    $opt_durable = "  durable => ${durable}\n"
  }

  if $ssl {
    validate_bool($ssl)
    $opt_ssl = "  ssl => ${ssl}\n"
  }

  if $exclusive {
    validate_bool($exclusive)
    $opt_exclusive = "  exclusive => ${exclusive}\n"
  }

  if $passive {
    validate_bool($passive)
    $opt_passive = "  passive => ${passive}\n"
  }

  if $ack {
    validate_bool($ack)
    $opt_ack = "  ack => ${ack}\n"
  }

  if $add_field {
    validate_hash($add_field)
    $arr_add_field = inline_template('<%= add_field.to_a.flatten.inspect %>')
    $opt_add_field = "  add_field => ${arr_add_field}\n"
  }

  if $threads {
    if ! is_numeric($threads) {
      fail("\"${threads}\" is not a valid threads parameter value")
    } else {
      $opt_threads = "  threads => ${threads}\n"
    }
  }

  if $prefetch_count {
    if ! is_numeric($prefetch_count) {
      fail("\"${prefetch_count}\" is not a valid prefetch_count parameter value")
    } else {
      $opt_prefetch_count = "  prefetch_count => ${prefetch_count}\n"
    }
  }

  if $port {
    if ! is_numeric($port) {
      fail("\"${port}\" is not a valid port parameter value")
    } else {
      $opt_port = "  port => ${port}\n"
    }
  }

  if $charset {
    if ! ($charset in ['ASCII-8BIT', 'UTF-8', 'US-ASCII', 'Big5', 'Big5-HKSCS', 'Big5-UAO', 'CP949', 'Emacs-Mule', 'EUC-JP', 'EUC-KR', 'EUC-TW', 'GB18030', 'GBK', 'ISO-8859-1', 'ISO-8859-2', 'ISO-8859-3', 'ISO-8859-4', 'ISO-8859-5', 'ISO-8859-6', 'ISO-8859-7', 'ISO-8859-8', 'ISO-8859-9', 'ISO-8859-10', 'ISO-8859-11', 'ISO-8859-13', 'ISO-8859-14', 'ISO-8859-15', 'ISO-8859-16', 'KOI8-R', 'KOI8-U', 'Shift_JIS', 'UTF-16BE', 'UTF-16LE', 'UTF-32BE', 'UTF-32LE', 'Windows-1251', 'BINARY', 'IBM437', 'CP437', 'IBM737', 'CP737', 'IBM775', 'CP775', 'CP850', 'IBM850', 'IBM852', 'CP852', 'IBM855', 'CP855', 'IBM857', 'CP857', 'IBM860', 'CP860', 'IBM861', 'CP861', 'IBM862', 'CP862', 'IBM863', 'CP863', 'IBM864', 'CP864', 'IBM865', 'CP865', 'IBM866', 'CP866', 'IBM869', 'CP869', 'Windows-1258', 'CP1258', 'GB1988', 'macCentEuro', 'macCroatian', 'macCyrillic', 'macGreek', 'macIceland', 'macRoman', 'macRomania', 'macThai', 'macTurkish', 'macUkraine', 'CP950', 'Big5-HKSCS:2008', 'CP951', 'stateless-ISO-2022-JP', 'eucJP', 'eucJP-ms', 'euc-jp-ms', 'CP51932', 'eucKR', 'eucTW', 'GB2312', 'EUC-CN', 'eucCN', 'GB12345', 'CP936', 'ISO-2022-JP', 'ISO2022-JP', 'ISO-2022-JP-2', 'ISO2022-JP2', 'CP50220', 'CP50221', 'ISO8859-1', 'Windows-1252', 'CP1252', 'ISO8859-2', 'Windows-1250', 'CP1250', 'ISO8859-3', 'ISO8859-4', 'ISO8859-5', 'ISO8859-6', 'Windows-1256', 'CP1256', 'ISO8859-7', 'Windows-1253', 'CP1253', 'ISO8859-8', 'Windows-1255', 'CP1255', 'ISO8859-9', 'Windows-1254', 'CP1254', 'ISO8859-10', 'ISO8859-11', 'TIS-620', 'Windows-874', 'CP874', 'ISO8859-13', 'Windows-1257', 'CP1257', 'ISO8859-14', 'ISO8859-15', 'ISO8859-16', 'CP878', 'Windows-31J', 'CP932', 'csWindows31J', 'SJIS', 'PCK', 'MacJapanese', 'MacJapan', 'ASCII', 'ANSI_X3.4-1968', '646', 'UTF-7', 'CP65000', 'CP65001', 'UTF8-MAC', 'UTF-8-MAC', 'UTF-8-HFS', 'UTF-16', 'UTF-32', 'UCS-2BE', 'UCS-4BE', 'UCS-4LE', 'CP1251', 'UTF8-DoCoMo', 'SJIS-DoCoMo', 'UTF8-KDDI', 'SJIS-KDDI', 'ISO-2022-JP-KDDI', 'stateless-ISO-2022-JP-KDDI', 'UTF8-SoftBank', 'SJIS-SoftBank', 'locale', 'external', 'filesystem', 'internal']) {
      fail("\"${charset}\" is not a valid charset parameter value")
    } else {
      $opt_charset = "  charset => \"${charset}\"\n"
    }
  }

  if $format {
    if ! ($format in ['plain', 'json', 'json_event']) {
      fail("\"${format}\" is not a valid format parameter value")
    } else {
      $opt_format = "  format => \"${format}\"\n"
    }
  }

  if $password {
    validate_string($password)
    $opt_password = "  password => \"${password}\"\n"
  }

  if $exchange {
    validate_string($exchange)
    $opt_exchange = "  exchange => \"${exchange}\"\n"
  }

  if $queue {
    validate_string($queue)
    $opt_queue = "  queue => \"${queue}\"\n"
  }

  if $key {
    validate_string($key)
    $opt_key = "  key => \"${key}\"\n"
  }

  if $host {
    validate_string($host)
    $opt_host = "  host => \"${host}\"\n"
  }

  if $type {
    validate_string($type)
    $opt_type = "  type => \"${type}\"\n"
  }

  if $user {
    validate_string($user)
    $opt_user = "  user => \"${user}\"\n"
  }

  if $message_format {
    validate_string($message_format)
    $opt_message_format = "  message_format => \"${message_format}\"\n"
  }

  if $vhost {
    validate_string($vhost)
    $opt_vhost = "  vhost => \"${vhost}\"\n"
  }

  #### Write config file

  $confdirstart = prefix($instances, "${logstash::params::configdir}/")
  $conffiles = suffix($confdirstart, "/config/input_amqp_${name}")
  $services = prefix($instances, 'logstash-')

  file { $conffiles:
    ensure  => present,
    content => "input {\n amqp {\n${opt_ack}${opt_add_field}${opt_arguments}${opt_auto_delete}${opt_charset}${opt_debug}${opt_durable}${opt_exchange}${opt_exclusive}${opt_format}${opt_host}${opt_key}${opt_message_format}${opt_passive}${opt_password}${opt_port}${opt_prefetch_count}${opt_queue}${opt_ssl}${opt_tags}${opt_threads}${opt_type}${opt_user}${opt_verify_ssl}${opt_vhost} }\n}\n",
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    notify  => Service[$services],
    require => Class['logstash::package', 'logstash::config']
  }
}
