package com.ku6.utils
{

    /**
     * 提供各种常用工具
     * @author Seven Yu
     */
    public final class Tools
    {
        
        /**
         * 获取一个随机颜色值
         * @return 随机颜色值
         */
        public static function getRandomColor():uint
        {
            return rang(0, 0xffffff);
        }

        /**
         * 随机生成介于 min 和 max 之间的整数 (包括 min 和 max)
         * @param	min   最小范围
         * @param	max   最大范围
         * @return  介于 min 和 max 之间的整数
         */
        public static function rang(min:int, max:int):int
        {
            return Math.round(Math.random() * (max - min)) + min;
        }
        
        /**
         * 遍历处理数组
         * @param	arr     数组
         * @param	func    处理函数 function (index:uint, item:*)
         */
        public static function walkArray(arr:Array, func:Function):void
        {
            var len:int = arr.length;
            for (var i:int = 0; i < len; i++) 
            {
                var item:* = arr[i];
                func(i, item);
            }
        }

        public function Tools()
        {
        }

    }

}