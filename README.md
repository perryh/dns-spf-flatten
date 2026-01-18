# dns-spf-flattener

A Go CLI tool to flatten DNS SPF records and output a list of IP addresses.

## Installation

```bash
go install github.com/perryh/dns-spf-flattener@latest
```

Or build from source:

```bash
go build -o dns-spf-flattener .
```

## Usage

```
dns-spf-flattener [options]
```

### Options

- `-ip4 value` - IPv4 addresses to include (can be specified multiple times)
- `-ip6 value` - IPv6 addresses to include (can be specified multiple times)
- `-include value` - Domain names to include SPF records from (can be specified multiple times)

### Examples

Flatten SPF records from include domains:

```bash
dns-spf-flattener -include gmail.com -include outlook.com
```

Combine manual IPs with include domains:

```bash
dns-spf-flattener -ip4 192.0.2.1 -ip4 192.0.2.2 -include example.com
```

Use IPv6 addresses:

```bash
dns-spf-flattener -ip6 2001:db8::1 -include example.com
```

## How It Works

1. Resolves the SPF record (TXT record starting with `v=spf1`) for each include domain
2. Extracts `ip4:` and `ip6:` entries from the SPF record
3. Recursively resolves nested `include:` entries
4. Combines all discovered IPs with the manually provided `-ip4` and `-ip6` addresses
5. Deduplicates and outputs the final list of IP addresses

## Environment Variables

- `DNS_RESOLVER` - Custom DNS resolver address (default: `127.0.0.1:53`)

Example:
```bash
DNS_RESOLVER=8.8.8.8:53 dns-spf-flattener -include example.com
```
