# Sample
A sample to show
- How to implement packages - naming and folder structure
- How to deploy Package or individual scripts

 
### Deploy all scripts
>EXEC dbo.zzz_sp_Deploy 'Sample'
--OR 
>EXEC dbo.zzz_sp_Deploy 'Sample/All.sql'

### Deploy individual scripts
>EXEC dbo.zzz_sp_Deploy 'Sample/zz_sp_Individual.sql'