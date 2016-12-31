## v0.1.1

Fixed the subnets so that they depend on the NAT gateway routes if they have
been requested. This fixes a race condition where the subnets may not be
routeable when they are expected to be. The subnet ID outputs now will block
until the NAT gateways are up, ensuring that modules that depend on the subnets
can safely assume that the routes are fully functional.

## v0.1.0

Initial release.
