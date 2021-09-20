require("harpoon").setup({
    -- nav_first_in_list = true,
    projects = {
        ["/home/feniljain/Projects/golang-projects/alom"] = {
            term = {
                cmds = {
                    "go run api/api.go\n",
                    "go run usecase/usecase.go\n",
                    "go mod tidy && go mod download\n",
                }
            }
        }
    }
})
