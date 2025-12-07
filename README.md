# Network Utilities Docker Image

This project provides a Docker image based on Alpine with a collection of essential network utilities. These tools are
useful for network diagnostics, testing, and troubleshooting.

## Included Utilities

The Docker image includes the following packages:

- **bash**: GNU Bourne-Again SHell with bash-completion.
- **bind-tools**: DNS utilities including `dig` and `nslookup`.
- **curl**: Command-line tool for transferring data with URLs, supporting various protocols.
- **iproute2**: Collection of utilities for network management, including `ip`.
- **iputils**: Tools to send ICMP ECHO_REQUEST to network hosts using `ping`.
- **nmap**: Network exploration tool and security/port scanner.
- **tcpdump**: Command-line packet analyzer.
- **busybox-extras**: Additional utilities including `telnet`.
- **traceroute**: Print the route packets take to a network host.
- **vim**: Vi IMproved, a programmers text editor.
- **wget**: Command-line utility for retrieving files from the web.

## Usage in Kubernetes

To deploy this image in a Kubernetes cluster, you can use the following deployment manifest. This setup allows you to
run the network utilities in a pod.

### Deployment Manifest

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: netutils
spec:
  replicas: 1
  selector:
    matchLabels:
      app: netutils
  template:
    metadata:
      labels:
        app: netutils
    spec:
      containers:
        - name: netutils
          image: nikitamishagin/netutils:latest
          command: [ "/bin/bash", "-c", "sleep infinity" ]
          # Uncomment below to run as a privileged pod
          # securityContext:
          #   privileged: true
      # Uncomment and modify nodeSelector below for specific node assignment
      # nodeSelector:
      #   kubernetes.io/hostname: specific-node
      # Uncomment the line below to enable host networking
      # hostNetwork: true
      dnsPolicy: ClusterFirst  # Default policy which uses cluster DNS first
      # Available options:
      # - ClusterFirst: Use cluster DNS service first, falling back to upstream DNS servers.
      # - ClusterFirstWithHostNet: Similar to ClusterFirst, but used when host networking is enabled (hostNetwork: true).
      # - Default: Use the default DNS resolver configured on the node.
      # - None: No DNS settings will be provided by the cluster. Use dnsConfig for custom DNS.
      # dnsConfig:
      #   nameservers:
      #     - 8.8.8.8
      #     - 8.8.4.4
      #   searches:
      #     - example.com
      #   options:
      #     - name: ndots
      #       value: "2"
```

### Example Usage

Once deployed, you can exec into the pod and use the network utilities:

```bash
kubectl exec -it deployments/netutils -- bash
```

Then, you can run any of the utilities as needed.

### Using with kubectl debug

You can also use this image with `kubectl debug` to troubleshoot existing pods:

```bash
# Attach netutils container to an existing pod
kubectl debug -it pod/your-pod-name --image=nikitamishagin/netutils:latest

# Debug a node with netutils (requires privileged access)
kubectl debug node/your-node-name -it --image=nikitamishagin/netutils:latest
```

The image is configured with bash as the entrypoint for kubectl debug compatibility.

## CI/CD

This project includes a GitHub Actions workflow configured to automatically build and push the Docker image to Docker
Hub whenever a new tag is pushed to the repository. The image is tagged with both the specific Git tag and `latest`.

## Contributing

Contributions are welcome! If you have any suggestions for improvements or new features, feel free to open an issue or
submit a pull request.

## License

This project is licensed under the Apache License 2.0. See the [LICENSE](./LICENSE) file for details.
