package com.ku6.display
{

    /**
     * 可移动类接口
     * @author Seven Yu
     */
    public interface IMoveable //# 接口命名以 I 开头
    {
        //# 方法名以动词开头
        function moveTo(x:Number, y:Number):void;
        function moveBy(x:Number, y:Number):void;
    }

}