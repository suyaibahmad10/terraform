# Not actively used
Creating two files, dev.tfbackend and prod.tfbackend to manage the state on two files.

For dev (dev.tfbackend) :
```
key = dev/state.tfstate
```


For prod (prod.tfbackend ):
```
key = prod/state.tfstate
```

Pass while init to initialize different:
```
terraform init -backend-config=prod.tfbackend