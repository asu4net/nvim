--  Mason will be used to install external
--  tools that some plugins require to work.
--  It is being used by roslyn:
--      Note: It is required to call a mason command to install roslyn:
--      :MasonInstall roslyn
return 
{
    "mason-org/mason.nvim",
    opts = {
        registries = {
            "github:mason-org/mason-registry",
            -- Default mason registry does not include roslyn for
            -- c#, so we have to add an extra registry.
            "github:Crashdummyy/mason-registry",
        },
    },
}
