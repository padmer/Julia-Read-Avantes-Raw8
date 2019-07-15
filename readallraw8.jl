"""
    readallraw8(folder,len=329)

Crummy function to read in all binary avasoft raw8 files from a folder

"""


function readavantesraw8(filename,len=329)
con=open(filename,"r")
    mark(con)
skip(con,14)
DeviceID=""
for i in 1:9
DeviceID=string(DeviceID,read(con,Char))
end
skip(con,305)
Xaxis=zeros(len)
for i in 1:len
    Xaxis[i]=read(con,Float32)
end
Yaxis=zeros(len)
for i in 1:len
    Yaxis[i]=read(con,Float32)
end
close(con);
    return(Xaxis,Yaxis)
end
function readallraw8(folder,len=329)
    files=glob("*.Raw8")
    Xaxis=fill(0.0,length(files),len)
    Yaxis=fill(0.0,length(files),len)
    for i in 1:length(files)
        Xt,Yt=readavantesraw8(files[i])
        Xaxis[i,:]=Xt
        Yaxis[i,:]=Yt
    end
    return(Xaxis,Yaxis)
end
