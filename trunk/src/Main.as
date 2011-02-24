/**
 * Ku6 AS3 编码规范 代码范例
 * 规范相关代码以 //# 注释标注
 * 
 * @version 0.0.2
 * @author Seven Yu
 * @since 2011.02.24
 * @copy (C) 2011 ku6.com
 */
package
{
    //# 先引入 flash 类, 同包下的类按字母排序
    import flash.display.Loader;
    import flash.display.SimpleButton;
    import flash.display.Sprite;
    import flash.events.Event;
    import flash.events.KeyboardEvent;
    import flash.events.MouseEvent;
    import flash.net.URLRequest;

    //# 引入公司类
    import com.ku6.display.Ball;
    import com.ku6.display.IMoveable;
    import com.ku6.display.Rect;
    import com.ku6.utils.Tools;
    import com.ku6.utils.Tools;

    
    /**
     * 传说中的文档类, 一般都继承自 Sprite
     * @author Seven Yu
     */
    public class Main extends Sprite
    {

        // 所有按键常量
        private const KEY_UP:uint = 38;
        private const KEY_DOWN:uint = 40;
        private const KEY_LEFT:uint = 37;
        private const KEY_RIGHT:uint = 39;

        private const KEY_W:uint = 87; // 对应上
        private const KEY_S:uint = 83; // 对应下
        private const KEY_A:uint = 65; // 对应左
        private const KEY_D:uint = 68; // 对应右

        private const KEY_R:uint = 82;
        // 按键常量定义结束

        private const MIN_STEP:int = 10; // 最小移动距离
        private const MAX_STEP:int = 50; // 最大移动距离

        private var items:Array = []; // 保存所有物体的数组

        //# 以下两个变量在初始化函数中(init -> createItems)有赋值, 所以这里不给初始值
        private var ball:Ball;
        private var rect:Rect;

        //# object 的定义
        private var obj1:Object = 
        { 
            key1: 'value1', 
            key2: true 
        };
            
        private var obj2:Object = { name: 'Object 2', version: '0.0.1' };


        //# 变量定义区与逻辑代码区可多空几行

        //# 函数名与小括号之间不插入空格
        public function Main():void
        {
            //# 关键字与小括号之间插入空格
            if (stage)
            {
                //# 即使语句块只有一句, 也要写大括号
                init();
            }
            else
            {
                addEventListener(Event.ADDED_TO_STAGE, init);
            }

            /*
            //# 若此处使用三元操作符, 可以写成:
            
            stage ?
                init() :
                addEventListener(Event.ADDED_TO_STAGE, init);
                
            //# 注意换行的三元操作符的格式
            */
        }

        /**
         * 初始化, 程序入口
         * @param	event
         */
        private function init(event:Event = null):void
        {
            removeEventListener(Event.ADDED_TO_STAGE, init);

            createItems();
            initItems();

            bindEvents();
        }

        /**
         * 创建物体
         */
        private function createItems():void
        {
            // 创建个球体
            ball = new Ball();
            addChild(ball);
            items.push(ball);

            // 创建个矩形
            rect = new Rect();
            addChild(rect);
            items.push(rect);
        }

        /**
         * 初始化物体位置
         */
        private function initItems():void
        {
            // 初始横坐标范围
            var minX:int = 0;
            var maxX:int = stage.stageWidth;

            // 初始纵坐标范围
            var minY:int = 0;
            var maxY:int = stage.stageHeight;

            var len:uint = items.length;

            for (var i:int = 0; i < len; i++)
            {
                var item:IMoveable = items[i] as IMoveable;

                var tempX:Number = Tools.rang(minX, maxX);
                var tempY:Number = Tools.rang(minY, maxY);

                item.moveTo(tempX, tempY);
            }
        }

        /**
         * 绑定所有事件
         */
        private function bindEvents():void
        {
            stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDownHandler);
        }

        /**
         * 处理键盘事件
         * @param	event //# 事件处理函数形参统一使用 event 变量名
         */
        private function keyDownHandler(event:KeyboardEvent):void
        {
            // 移动目标点
            var toX:Number = 0;
            var toY:Number = 0;

            //# switch 格式
            switch (event.keyCode)
            {
                // 向上
                case KEY_W:
                case KEY_UP:
                {
                    toY = -Tools.rang(MIN_STEP, MAX_STEP);
                    break;
                }
                // 向下
                case KEY_S:
                case KEY_DOWN:
                {
                    toY = Tools.rang(MIN_STEP, MAX_STEP);
                    break;
                }
                // 向左
                case KEY_A:
                case KEY_LEFT:
                {
                    toX = -Tools.rang(MIN_STEP, MAX_STEP);
                    break;
                }
                // 向右
                case KEY_D:
                case KEY_RIGHT:
                {
                    toX = Tools.rang(MIN_STEP, MAX_STEP);
                    break;
                }
                // R 键
                case KEY_R:
                {
                    // 重置所有物体;
                    initItems();
                    // 改变矩形颜色
                    rect.color = Tools.getRandomColor();
                    break;
                }
                default:
                {
                    //# 即使 default 不做任何事, 也要有语句块存在
                    //trace('key code:', event.keyCode);
                    break;
                }
            } // switch end

            //# 逻辑块之间插入空行
            // 判断是否该移动物体
            if (toX != 0 || toY != 0)
            {
                // 移动所有物体
                Tools.walkArray(items, function(index:int, item:IMoveable):void //# 简单处理使用匿名函数
                    {
                        //# 匿名函数体缩进一级
                        item.moveBy(toX, toY);
                    });
            }
        }



    }

}