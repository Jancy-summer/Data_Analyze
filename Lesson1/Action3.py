# 3.对汽车质量数据进行统计
import pandas as pd
result = pd.read_csv('car_complain.csv')
# print(result)
result = result.drop('problem', 1).join(result.problem.str.get_dummies(','))
# print(result)
# print(result.columns)
# tags = result.columns[7:]
# print(tags)

print("品牌投诉总数：")
df_brand = result.groupby(['brand'])['id'].agg(['count']).sort_values('count', ascending=False)
print(df_brand)
print("车型投诉总数：")
df_car_model = result.groupby(['car_model'])['id'].agg(['count']).sort_values('count', ascending=False)
print(df_car_model)

print("品牌的平均车型投诉:")
# 品牌车型总数：
df1 = result.groupby(['brand']).car_model.nunique()
# print(df1)
df3 = pd.merge(df1, df_brand, on = 'brand')
# print(df3)
# 品牌车型投诉平均数：
df3['averge'] = df3.apply(lambda x: x[1]/x[0], axis=1)
print(df3.sort_values('averge', ascending=False))
