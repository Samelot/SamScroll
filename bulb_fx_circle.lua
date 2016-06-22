require("class")
    
-- temp circles
--local circ = BulbFXCirc(100, 100, 50, 20) 
--circ:type1() 
--local circ2 = BulbFXCirc(200, 200, 50, 20, 232)
--circ2:type2(group)
    
BulbFXCirc = class(function(c, x, y, w, h, rot)
    c.x = x
    c.y = y
    c.w = w
    c.h = h
    c.rot = rot
end)

function BulbFXCirc:type1()
    function display.newEllipse(x,y,w,h)
        local circle = display.newCircle(0,0,w/2)
        local ellipse = display.newGroup()
        ellipse:insert(circle)
        ellipse.x, ellipse.y  = w/2, h/2
        ellipse.yScale = h/w
        circle.x, circle.y = x, y+h
        return circle
    end
    return display.newEllipse(self.x, self.y, self.w, self.h)
end

function BulbFXCirc:type2(group)

    function display.newArc(group, x,y,w,h,s,e,rot) -- modification of original code by: rmbsoft (Corona Forums Member)
        local theArc = display.newGroup()

        local xc,yc,xt,yt,cos,sin = 0,0,0,0,math.cos,math.sin --w/2,h/2,0,0,math.cos,math.sin
        s,e = s or 0, e or 360
        s,e = math.rad(s),math.rad(e)
        w,h = w/2,h/2
        local l = display.newLine(0,0,0,0)
        l:setColor(54, 251, 9)
        l.width = 4
                
        theArc:insert( l )
        
        for t=s,e,0.02 do 
            local cx,cy = xc + w*cos(t), yc - h*sin(t)
            l:append(cx,cy) 
        end

        group:insert( theArc )

        -- Center, Rotate, then translate       
        theArc.x,theArc.y = 0,0
        theArc.rotation = rot
        theArc.x,theArc.y = x,y
            
        return theArc
    end
    
    return display.newArc(group, self.x, self.y, self.w, self.h, nil, nil, self.rot) 
end
