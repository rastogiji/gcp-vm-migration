# Migration of VM's across GCP projects

Migrate fleet of VM's across GCP projects. The script automates migrating VM's identified by a specific regular expression from one project to another project.

For VMs that are hosting stateless applications, this process involves near-zero data loss with minimal downtime.

For stateful applications, downtime is large since you need to stop the VMs beforehand to avoid any data loss in the destination system.

## Solution Flow

High Level overview of how a VM is migrated:
- Create snapshot of the disk.
- Create an image from the snapshot in the source project.
- Create a VM in the destination project from VM in the source project.

## Usage

```bash
./master.sh <source-project-id> <destinaton-project-id>
```

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License
[MIT](https://github.com/rastogiji/gcp-vm-migration/blob/master/LICENSE)
