#!/bin/bash

# Example usage script for dns-spf-flattener

echo "Example 1: Flatten SPF records from include domains"
echo "Command: ./dns-spf-flattener -include gmail.com"
echo "(Note: This requires working DNS resolution)"
echo ""

echo "Example 2: Combine manual IPs with include domains"
echo "Command: ./dns-spf-flattener -ip4 192.0.2.1 -ip4 192.0.2.2 -include example.com"
echo ""

echo "Example 3: Use IPv6 addresses"
echo "Command: ./dns-spf-flattener -ip6 2001:db8::1 -ip6 2001:db8::2"
echo ""

echo "Example 4: Mixed IPv4 and IPv6 with includes"
echo "Command: ./dns-spf-flattener -ip4 192.0.2.1 -ip6 2001:db8::1 -include example.com"
echo ""

echo "Example 5: Test with manual IPs only"
echo "Running: ./dns-spf-flattener -ip4 192.0.2.1 -ip4 192.0.2.2 -ip6 2001:db8::1"
echo ""
./dns-spf-flattener -ip4 192.0.2.1 -ip4 192.0.2.2 -ip6 2001:db8::1
