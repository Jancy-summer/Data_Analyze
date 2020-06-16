# 2.统计全班的成绩
from pandas import DataFrame
data = {'Chinese': [68, 95, 98, 90, 80], '数学': [65, 76, 86, 88, 90], 'English': [30, 98, 88, 77, 90]}
df = DataFrame(data, index=['ZhangFei', 'GuanYu', 'LiuBei', 'DianWei', 'XuChu'], columns=['Chinese', '数学', 'English'])
# print(df)
print("平均成绩：", df.mean())
print("最小成绩：", df.min())
print("最大成绩：", df.max())
print("方差：", df.var())
print("标准差：", df.std())
df['总成绩'] = df.sum(axis=1)
print(df.sort_values('总成绩', ascending=False))
