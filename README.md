# RemoteOpsValidationLib
Repository housing remote operations validation tests.

# Repository structure <tenative>
Plan to use the below format for the repository structure.

```
Root\
      -Vendor
        - Vendor_Product_A
            - Component or Functionaly targeted Ops_validation tests sample
            - Constraint file (housing the validated platforms, with pre-reqs called out. Constraint file could be a .ps1 which could be run to verify that the nodes or solution being targeted is correct)
```        
          
To give an example of what I have in mind :

```
Repo Root\
      -Microsoft
        - General (Tests which are generic and can be targeted based on PowerShell version running on Windows OS)
          - Networking.Sample.PSRemotely.ps1
          - Domain.Sample.PSRemotely.ps1
          - Constraint.ps1 
        - Storage Spaces Direct
            - Networking.Sample.PSRemotely.ps1
            - S2D.Sample.PSRemotely.ps1
            - Cluster.Sample.PSRemotely.ps1
        - Azure Stack
            - Networking.Sample.PSRemotely.ps1
            - Cluster.Sample.PSRemotely.ps1
            
```
