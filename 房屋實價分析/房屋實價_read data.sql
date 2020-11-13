use [房屋實價登入系統]

/*
 不動產買賣
*/

insert [land].[Main_a]
execute sp_execute_external_script
@language = N'Python',
@script = N'
from glob import glob
import pandas as pd

path = r"C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\PYTHON_SERVICES\lvr_landcsv"
pattern = ["?_lvr_land_a.csv",\
           "?_lvr_land_a_build.csv",\
           "?_lvr_land_a_land.csv",\
           "?_lvr_land_a_park.csv",\
           "?_lvr_land_b.csv",\
           "?_lvr_land_b_build.csv",\
           "?_lvr_land_b_land.csv",\
           "?_lvr_land_b_park.csv",\
           "?_lvr_land_c.csv",\
           "?_lvr_land_c_build.csv",\
           "?_lvr_land_c_land.csv",\
           "?_lvr_land_c_park.csv"]

for i in [0]:
    
    files = glob(path + "\\" + pattern[i])
    
    for f in files:
        
        df = pd.read_csv(f)
        df = df.iloc[1:]
        df = df.fillna(value="")
        
        if "交易年月日" in df:

            for index, row in df.iterrows():
                row.交易年月日 = str(int(row.交易年月日) + 19110000)

                if bool(row.建築完成年月):
                    row.建築完成年月 = str(int(row.建築完成年月) + 19110000)

            OutputDataSet = OutputDataSet.append(df)
'

/*
 預售屋買賣
*/

insert [land].[Main_b]
execute sp_execute_external_script
@language = N'Python',
@script = N'
from glob import glob
import pandas as pd

path = r"C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\PYTHON_SERVICES\lvr_landcsv"
pattern = ["?_lvr_land_a.csv",\
           "?_lvr_land_a_build.csv",\
           "?_lvr_land_a_land.csv",\
           "?_lvr_land_a_park.csv",\
           "?_lvr_land_b.csv",\
           "?_lvr_land_b_build.csv",\
           "?_lvr_land_b_land.csv",\
           "?_lvr_land_b_park.csv",\
           "?_lvr_land_c.csv",\
           "?_lvr_land_c_build.csv",\
           "?_lvr_land_c_land.csv",\
           "?_lvr_land_c_park.csv"]

for i in [4]:
    
    files = glob(path + "\\" + pattern[i])
    
    for f in files:
        
        df = pd.read_csv(f)
        df = df.iloc[1:]
        df = df.fillna(value="")
        
        if "交易年月日" in df:

            for index, row in df.iterrows():
                row.交易年月日 = str(int(row.交易年月日) + 19110000)

                if bool(row.建築完成年月):
                    row.建築完成年月 = str(int(row.建築完成年月) + 19110000)

            OutputDataSet = OutputDataSet.append(df)
'


/*
 Main_Rent 租賃檔案
*/
insert [land].[c_Main_Rent]
execute sp_execute_external_script
@language = N'Python',
@script = N'
from glob import glob
import pandas as pd

path = r"C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\PYTHON_SERVICES\lvr_landcsv"
pattern = ["?_lvr_land_a.csv",\
           "?_lvr_land_a_build.csv",\
           "?_lvr_land_a_land.csv",\
           "?_lvr_land_a_park.csv",\
           "?_lvr_land_b.csv",\
           "?_lvr_land_b_build.csv",\
           "?_lvr_land_b_land.csv",\
           "?_lvr_land_b_park.csv",\
           "?_lvr_land_c.csv",\
           "?_lvr_land_c_build.csv",\
           "?_lvr_land_c_land.csv",\
           "?_lvr_land_c_park.csv"]


for i in [8]:
    #path_filename = path + "\\" + pattern[i]
    #print(path + "\\" + pattern[i])
    
    files = glob(path + "\\" + pattern[i])
    
    for f in files:
        
        df = pd.read_csv(f)
        df = df.iloc[1:]
        df = df.fillna(value="")

        if "租賃年月日" in df:
            
            for index, row in df.iterrows():
                row.租賃年月日 = str(int(row.租賃年月日) + 19110000)

                if bool(row.建築完成年月):
                    row.建築完成年月 = str(int(row.建築完成年月) + 19110000)

            OutputDataSet = OutputDataSet.append(df)
'

--------------------------------------------------------------------------------
/*
 Build 建物不動產買賣
*/
insert [land].[a_Build]
execute sp_execute_external_script
@language = N'Python',
@script = N'
from glob import glob
from datetime import datetime
import pandas as pd

path = r"C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\PYTHON_SERVICES\lvr_landcsv"
pattern = ["?_lvr_land_a.csv",\
           "?_lvr_land_a_build.csv",\
           "?_lvr_land_a_land.csv",\
           "?_lvr_land_a_park.csv",\
           "?_lvr_land_b.csv",\
           "?_lvr_land_b_build.csv",\
           "?_lvr_land_b_land.csv",\
           "?_lvr_land_b_park.csv",\
           "?_lvr_land_c.csv",\
           "?_lvr_land_c_build.csv",\
           "?_lvr_land_c_land.csv",\
           "?_lvr_land_c_park.csv"]

for i in [1]:
    
    files = glob(path + "\\" + pattern[i])
    
    for f in files:
        
        df = pd.read_csv(f)
        df = df.iloc[1:]
        df = df.fillna(value="")

        if "建築完成日期" in df:
            
            for index, row in df.iterrows():
                
                if bool(row.建築完成日期):
                    yp = row.建築完成日期.find("年")
                    y = int(row.建築完成日期[: yp]) + 1911

                    mp = row.建築完成日期.find("月")
                    m = int(row.建築完成日期[yp + 1 : mp])

                    dp = row.建築完成日期.find("日")
                    d = int(row.建築完成日期[mp + 1 : dp])

                    ymd = str(datetime(y, m, d))[:10]
                    row.建築完成日期 = ymd
                    
            OutputDataSet = OutputDataSet.append(df)
'

/*
 Land 土地不動產買賣
*/
insert [land].[a_Land]

execute sp_execute_external_script
@language = N'Python',
@script = N'
from glob import glob
import pandas as pd

path = r"C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\PYTHON_SERVICES\lvr_landcsv"
pattern = ["?_lvr_land_a.csv",\
           "?_lvr_land_a_build.csv",\
           "?_lvr_land_a_land.csv",\
           "?_lvr_land_a_park.csv",\
           "?_lvr_land_b.csv",\
           "?_lvr_land_b_build.csv",\
           "?_lvr_land_b_land.csv",\
           "?_lvr_land_b_park.csv",\
           "?_lvr_land_c.csv",\
           "?_lvr_land_c_build.csv",\
           "?_lvr_land_c_land.csv",\
           "?_lvr_land_c_park.csv"]

for i in [2]:
    
    files = glob(path + "\\" + pattern[i])
    
    for f in files:
        
        df = pd.read_csv(f)
        df = df.iloc[1:]
        df = df.fillna(value="")

                   
        OutputDataSet = OutputDataSet.append(df)
'



--------------------------------------------------------------------------------
/*
 Park 停車場不動產買賣
*/
insert [land].[a_Park]

execute sp_execute_external_script
@language = N'Python',
@script = N'
from glob import glob
import pandas as pd

path = r"C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\PYTHON_SERVICES\lvr_landcsv"
pattern = ["?_lvr_land_a.csv",\
           "?_lvr_land_a_build.csv",\
           "?_lvr_land_a_land.csv",\
           "?_lvr_land_a_park.csv",\
           "?_lvr_land_b.csv",\
           "?_lvr_land_b_build.csv",\
           "?_lvr_land_b_land.csv",\
           "?_lvr_land_b_park.csv",\
           "?_lvr_land_c.csv",\
           "?_lvr_land_c_build.csv",\
           "?_lvr_land_c_land.csv",\
           "?_lvr_land_c_park.csv"]


for i in [3]:
    
    files = glob(path + "\\" + pattern[i])
    
    for f in files:
        
        df = pd.read_csv(f)
        df = df.iloc[1:]
        df = df.fillna(value="")

                   
        OutputDataSet = OutputDataSet.append(df)
'

--------------------------------------------------------------------------------
/*
 Land 土地預售屋買賣
*/
insert [land].[b_Land]

execute sp_execute_external_script
@language = N'Python',
@script = N'
from glob import glob
import pandas as pd

path = r"C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\PYTHON_SERVICES\lvr_landcsv"
pattern = ["?_lvr_land_a.csv",\
           "?_lvr_land_a_build.csv",\
           "?_lvr_land_a_land.csv",\
           "?_lvr_land_a_park.csv",\
           "?_lvr_land_b.csv",\
           "?_lvr_land_b_build.csv",\
           "?_lvr_land_b_land.csv",\
           "?_lvr_land_b_park.csv",\
           "?_lvr_land_c.csv",\
           "?_lvr_land_c_build.csv",\
           "?_lvr_land_c_land.csv",\
           "?_lvr_land_c_park.csv"]

for i in [6]:
    
    files = glob(path + "\\" + pattern[i])
    
    for f in files:
        
        df = pd.read_csv(f)
        df = df.iloc[1:]
        df = df.fillna(value="")

                   
        OutputDataSet = OutputDataSet.append(df)
'



/*
 Park 停車場預售屋買賣
*/
insert [land].[b_Park]

execute sp_execute_external_script
@language = N'Python',
@script = N'
from glob import glob
import pandas as pd

path = r"C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\PYTHON_SERVICES\lvr_landcsv"
pattern = ["?_lvr_land_a.csv",\
           "?_lvr_land_a_build.csv",\
           "?_lvr_land_a_land.csv",\
           "?_lvr_land_a_park.csv",\
           "?_lvr_land_b.csv",\
           "?_lvr_land_b_build.csv",\
           "?_lvr_land_b_land.csv",\
           "?_lvr_land_b_park.csv",\
           "?_lvr_land_c.csv",\
           "?_lvr_land_c_build.csv",\
           "?_lvr_land_c_land.csv",\
           "?_lvr_land_c_park.csv"]


for i in [7]:
    
    files = glob(path + "\\" + pattern[i])
    
    for f in files:
        
        df = pd.read_csv(f)
        df = df.iloc[1:]
        df = df.fillna(value="")

                   
        OutputDataSet = OutputDataSet.append(df)
'



--------------------------------------------------------------------------------
/*
 Build 建物不動產租賃
*/
insert [land].[c_Build]

execute sp_execute_external_script
@language = N'Python',
@script = N'
from glob import glob
from datetime import datetime
import pandas as pd

path = r"C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\PYTHON_SERVICES\lvr_landcsv"
pattern = ["?_lvr_land_a.csv",\
           "?_lvr_land_a_build.csv",\
           "?_lvr_land_a_land.csv",\
           "?_lvr_land_a_park.csv",\
           "?_lvr_land_b.csv",\
           "?_lvr_land_b_build.csv",\
           "?_lvr_land_b_land.csv",\
           "?_lvr_land_b_park.csv",\
           "?_lvr_land_c.csv",\
           "?_lvr_land_c_build.csv",\
           "?_lvr_land_c_land.csv",\
           "?_lvr_land_c_park.csv"]

for i in [9]:
    
    files = glob(path + "\\" + pattern[i])
    
    for f in files:
        
        df = pd.read_csv(f)
        df = df.iloc[1:]
        df = df.fillna(value="")

        if "建築完成日期" in df:
            
            for index, row in df.iterrows():
                
                if bool(row.建築完成日期):
                    yp = row.建築完成日期.find("年")
                    y = int(row.建築完成日期[: yp]) + 1911

                    mp = row.建築完成日期.find("月")
                    m = int(row.建築完成日期[yp + 1 : mp])

                    dp = row.建築完成日期.find("日")
                    d = int(row.建築完成日期[mp + 1 : dp])

                    ymd = str(datetime(y, m, d))[:10]
                    row.建築完成日期 = ymd
                    
            OutputDataSet = OutputDataSet.append(df)
'


/*
 Land 土地不動產租賃
*/
insert [land].[c_Land]

execute sp_execute_external_script
@language = N'Python',
@script = N'
from glob import glob
import pandas as pd

path = r"C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\PYTHON_SERVICES\lvr_landcsv"
pattern = ["?_lvr_land_a.csv",\
           "?_lvr_land_a_build.csv",\
           "?_lvr_land_a_land.csv",\
           "?_lvr_land_a_park.csv",\
           "?_lvr_land_b.csv",\
           "?_lvr_land_b_build.csv",\
           "?_lvr_land_b_land.csv",\
           "?_lvr_land_b_park.csv",\
           "?_lvr_land_c.csv",\
           "?_lvr_land_c_build.csv",\
           "?_lvr_land_c_land.csv",\
           "?_lvr_land_c_park.csv"]

for i in [10]:
    
    files = glob(path + "\\" + pattern[i])
    
    for f in files:
        
        df = pd.read_csv(f)
        df = df.iloc[1:]
        df = df.fillna(value="")

                   
        OutputDataSet = OutputDataSet.append(df)
'




/*
 Park 停車場不動產租賃
*/

insert [land].[c_Park]

execute sp_execute_external_script
@language = N'Python',
@script = N'
from glob import glob
import pandas as pd

path = r"C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\PYTHON_SERVICES\lvr_landcsv"
pattern = ["?_lvr_land_a.csv",\
           "?_lvr_land_a_build.csv",\
           "?_lvr_land_a_land.csv",\
           "?_lvr_land_a_park.csv",\
           "?_lvr_land_b.csv",\
           "?_lvr_land_b_build.csv",\
           "?_lvr_land_b_land.csv",\
           "?_lvr_land_b_park.csv",\
           "?_lvr_land_c.csv",\
           "?_lvr_land_c_build.csv",\
           "?_lvr_land_c_land.csv",\
           "?_lvr_land_c_park.csv"]


for i in [11]:
    
    files = glob(path + "\\" + pattern[i])
    
    for f in files:
        
        df = pd.read_csv(f)
        df = df.iloc[1:]
        df = df.fillna(value="")

                   
        OutputDataSet = OutputDataSet.append(df)
'
