# Kitchen::Dropbear: A Test Kitchen Transport using Dropbear SSH

This transport is usable if you, for some reason, cannot use the system ssh
binary. It is not intended for production use though, as it was born out of
a malware-scanner related broken Linux system. So I used the opportunity to
go a bit overboard on a specific driver.

In it's core it is pretty easy, as it just inherits from the Kitchen built-in
SSH driver and replaces the system calls (why are there system calls anyway?)
with some to the dropbear client.

## Usage

```
---
transport:
  name: dropbear

# now the rest of your kitchen.yml follows
```

You need to have dropbear's `dbclient` installed on your system for obvious
reasons.

## Configuration

```yaml
transport:
  dbclient_bin: /some/path/to/dbclient
```

## Supported Platforms

Support for all platforms where Dropbear can be installed.

## <a name="license"></a> License

Apache 2.0 (see [LICENSE][license])

[license]:          https://github.com/tecracer_theinen/kitchen-dropbear/blob/master/LICENSE
