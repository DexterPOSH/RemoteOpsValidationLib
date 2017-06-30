# Use the PSRemotely DSL to wrap the existing Pester tests and target remote nodes
PSRemotely -Path "$PSScriptRoot\EnvironmentConfigData.psd1" {
    
    # All the nodes in the solution are to be targeted
    Node $AllNodes.NodeName {
        # Ensure that Server 2016 OS installation is done.
        Describe "Operating system installed validation" {
            $OS = Get-CimInstance -Class Win32_OperatingSystem
            Context "Server Type check" {
                It "Should have the OSType as WinNT" {
                    $OS.OSType | Should Be 18
                }
            }

            Context 'Server 2016 check' {
                It "Should have server 2016 installed" {
                $OS.Caption | Should BeLike '*Server 2016*'
                }
            }
        }

        # Validate that the domain account is part of the local administrators group on a node.
        Describe "Domain account is local administrator validation" {

            $LocalGroupMember = Get-LocalGroupMember -Group Administrators -Member "$($Node.DomainUser)" -ErrorAction SilentlyContinue

            It "Should be member of local admins group" {
                $LocalGroupMember | Should NOT BeNullOrEmpty
            }
        }
    }
}