package com.ku6.display
{
    //# 先引入 flash 类
    import flash.display.Shape;
    
    //# 引入第三方类
    import com.greensock.TweenLite;

    /**
     * 一个可以移动的球
     * @author Seven Yu
     */
    public class Ball extends Shape implements IMoveable
    {

        private const BALL_COLOR:uint = 0x008000; // 球体颜色
        private const BALL_RADIUS:uint = 30; // 球体半径

        private const MOTION_TIME:Number = 1.2; // 动画时长
        
        // 原始坐标, 保持目标坐标的累加
        private var oldX:Number = 0;
        private var oldY:Number = 0;


        public function Ball()
        {
            drawBall();
        }

        /**
         * 绘制球形
         */
        private function drawBall():void
        {
            //# 直接量定义为常量
            graphics.beginFill(BALL_COLOR);
            graphics.drawCircle(0, 0, BALL_RADIUS);
            graphics.endFill();
        }

        /**
         * 移动到坐标 (x, y) 点
         * @param   x   横坐标
         * @param   y   纵坐标
         * @see     moveBy
         */
        public function moveTo(x:Number, y:Number):void
        {
            TweenLite.killTweensOf(this);
            
            this.x = oldX = x;
            this.y = oldY = y;
        }

        /**
         * 移动距离 横向移动 x, 纵向移动 y
         * @param	x
         * @param	y
         * @see     moveTo
         */
        public function moveBy(x:Number, y:Number):void
        {
            oldX += x;
            oldY += y;
            TweenLite.to(this, MOTION_TIME, { x: oldX, y: oldY } );
        }
    }

}