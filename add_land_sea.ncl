;;;draw boundaries function
 procedure draw_paleo_LSM_dash_2d(wks,plot,topo,TLAT,TLONG,res) begin
   do i = 0,dimsizes(TLAT(:,0))-1
    do j = 0,dimsizes(TLONG(0,:))-1
     if(TLONG(i,j).gt.79.0.or.TLONG(i,j).lt.-10.0)
     if(topo(i,j).eq.1) then
       if(j.eq.0) then
        xl = TLONG(i,0)
        else
        xl = (TLONG(i,j-1)+TLONG(i,j))/2.
       end if
       if(i.eq.0) then
         yb = TLAT(i,j)
        else
         yb = (TLAT(i-1,j)+TLAT(i,j))/2.
        end if
       if(j.eq.dimsizes(TLONG(0,:))-1) then
        xr = TLONG(i,0)
        else
        xr = (TLONG(i,j+1)+TLONG(i,j))/2.
       end if
       if(i.eq.dimsizes(TLAT(:,0))-1) then
         yt = TLAT(i,j)
        else
         yt = (TLAT(i+1,j)+TLAT(i,j))/2.
        end if
        if(abs(xr-xl).lt.5.) then
       gsn_polyline(wks,plot,(/xr,xl/),(/yt,yb/),res)
        end if
     end if
     end if
   end do
   end do
 end
 procedure draw_paleo_LSM_dash_2dl(wks,plot,topo,TLAT,TLONG,res) begin
   do i = 0,dimsizes(TLAT(:,0))-1
    do j = 0,dimsizes(TLONG(0,:))-1
     if(TLONG(i,j).gt.79.0.or.TLONG(i,j).lt.-10.0)
     if(topo(i,j).eq.1) then
       if(j.eq.0) then
        xl = TLONG(i,0)
        else
        xl = (TLONG(i,j-1)+TLONG(i,j))/2.
       end if
       if(i.eq.0) then
         yb = TLAT(i,j)
        else
         yb = (TLAT(i-1,j)+TLAT(i,j))/2.
        end if
       if(j.eq.dimsizes(TLONG(0,:))-1) then
        xr = TLONG(i,0)
        else
        xr = (TLONG(i,j+1)+TLONG(i,j))/2.
       end if
       if(i.eq.dimsizes(TLAT(:,0))-1) then
         yt = TLAT(i,j)
        else
         yt = (TLAT(i+1,j)+TLAT(i,j))/2.
        end if
        if(abs(xr-xl).lt.5.) then
       gsn_polyline(wks,plot,(/xl,xr/),(/yt,yb/),res)
        end if
     end if
     end if
   end do
   end do
 end
 procedure draw_paleo_LSM_dash_1d(wks,plot,topo,TLAT,TLONG,res) begin
   do i = 0,dimsizes(TLAT(:))-1
    do j = 0,dimsizes(TLONG(:))-1
     if(topo(i,j).eq.1) then
       if(j.eq.0) then
        xl = TLONG(0)
        else
        xl = (TLONG(j-1)+TLONG(j))/2.
       end if
       if(i.eq.0) then
         yb = TLAT(i)
        else
         yb = (TLAT(i-1)+TLAT(i))/2.
        end if
       if(j.eq.dimsizes(TLONG(:))-1) then
        xr = TLONG(j)
        else
        xr = (TLONG(j+1)+TLONG(j))/2.
       end if
       if(i.eq.dimsizes(TLAT(:))-1) then
         yt = TLAT(i)
        else
         yt = (TLAT(i+1)+TLAT(i))/2.
        end if
       gsn_polyline(wks,plot,(/xr,xl/),(/yt,yb/),res)
     end if
   end do
   end do
 end
 procedure draw_paleo_LSM_dash_1dl(wks,plot,topo,TLAT,TLONG,res) begin
   do i = 0,dimsizes(TLAT(:))-1
    do j = 0,dimsizes(TLONG(:))-1
     if(topo(i,j).eq.1) then
       if(j.eq.0.or.j.eq.dimsizes(TLONG(:))-1) then
        xl = TLONG(0)
        else
        xl = (TLONG(j-1)+TLONG(j))/2.
       end if
       if(i.eq.0.or.i.eq.dimsizes(TLAT(:))-1) then
         yb = TLAT(i)
        else
         yb = (TLAT(i-1)+TLAT(i))/2.
        end if
       if(j.eq.dimsizes(TLONG(:))-1) then
        xr = TLONG(j)
        else
        xr = (TLONG(j+1)+TLONG(j))/2.
       end if
       if(i.eq.dimsizes(TLAT(:))-1) then
         yt = TLAT(i)
        else
         yt = (TLAT(i+1)+TLAT(i))/2.
        end if
       gsn_polyline(wks,plot,(/xl,xr/),(/yt,yb/),res)
     end if
   end do
   end do
 end
 procedure draw_paleo_LSM_border_2d(wks,plot,topo,TLAT,TLONG,res) begin
   do i = 0,dimsizes(TLAT(:,0))-2
    do j = 0,dimsizes(TLONG(0,:))-2
     if(topo(i,j).ne.topo(i+1,j)) then
       if(j.eq.0) then
        xl = TLONG(i,0)
        else
        xl = (TLONG(i,j-1)+TLONG(i,j))/2.
       end if
        xr = (TLONG(i,j)+TLONG(i,j+1))/2.
        yy = (TLAT(i,j)+TLAT(i+1,j))/2.
       gsn_polyline(wks,plot,(/xl,xr/),(/yy,yy/),res)
     end if
     if(topo(i,j).ne.topo(i,j+1)) then
       if(i.eq.0) then
         yb = TLAT(i,j)
        else
         yb = (TLAT(i-1,j)+TLAT(i,j))/2.
        end if
         yt = (TLAT(i,j)+TLAT(i+1,j))/2.
         xx = (TLONG(i,j+1)+TLONG(i,j))/2.
      gsn_polyline(wks,plot,(/xx,xx/),(/yb,yt/),res)
       end if
   end do
   end do
 end
 procedure draw_paleo_LSM_border_1d(wks,plot,topo,TLAT,TLONG,res) begin
   do i = 0,dimsizes(TLAT(:))-2
    do j = 0,dimsizes(TLONG(:))-2
    if(topo(i,j).ne.topo(i+1,j)) then
     if(j.eq.0) then
        xl = TLONG(0)
        else
        xl = (TLONG(j-1)+TLONG(j))/2.
       end if
        xr = (TLONG(j)+TLONG(j+1))/2.
        yy = (TLAT(i)+TLAT(i+1))/2.
       gsn_polyline(wks,plot,(/xl,xr/),(/yy,yy/),res)
     end if
     if(topo(i,j).ne.topo(i,j+1)) then
       if(i.eq.0) then
         yb = TLAT(i)
        else
         yb = (TLAT(i-1)+TLAT(i))/2.
        end if
         yt = (TLAT(i)+TLAT(i+1))/2.
         xx = (TLONG(j+1)+TLONG(j))/2.
      gsn_polyline(wks,plot,(/xx,xx/),(/yb,yt/),res)
       end if
   end do
   end do
 end
