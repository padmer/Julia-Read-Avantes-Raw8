"""
    readallraw8(folder,len=329)

Crummy function to read in all binary avasoft raw8 files from a folder

"""
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
