package com.ku6.display
{
    import flash.display.Shape;

    /**
     * 一个可以移动的矩形
     * @author Seven Yu
     */
    public class Rect extends Shape implements IMoveable
    {

        private const RECT_COLOR:uint = 0x0000ff; // 矩形填充颜色
        private const RECT_LENGTH:uint = 60; // 矩形变长

        private var _color:uint = RECT_COLOR; // 矩形颜色属性


        public function Rect()
        {
            drawRect(RECT_COLOR);
        }

        /**
         * 绘制矩形
         * @param	color  矩形颜色
         */
        private function drawRect(color:uint):void
        {
            // 矩形一半边长, 用于定位
            var halfLength:uint = RECT_LENGTH / 2;

            graphics.beginFill(color);
            graphics.drawRect(-halfLength, -halfLength, RECT_LENGTH, RECT_LENGTH);
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
            this.x = x;
            this.y = y;
        }

        /**
         * 移动距离 横向移动 x, 纵向移动 y
         * @param	x
         * @param	y
         * @see     moveTo
         */
        public function moveBy(x:Number, y:Number):void
        {
            // TODO 为此方法增加动态效果
            //# 使用 TODO 或 FIXME 关键字标识后期待处理代码
            this.x += x;
            this.y += y;
        }

        /**
         * 矩形的颜色
         */
        public function set color(value:uint):void
        {
            //# 与原始值进行比较, 若相同则不再重绘
            if (value == _color)
            {
                return;
            }
            
            drawRect(value);
        }
    }

}