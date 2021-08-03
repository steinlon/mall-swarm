package com.macro.mall.common.api;

/**
 * 通用返回对象
 */
public class CommonResult<T> {

    private IErrorCode errorCode;
    private long code;
    private String message;
    private T data;

    protected CommonResult() {
    }

    protected CommonResult(final IErrorCode errorCode, final String message, final T data) {
        this.errorCode = errorCode;
        this.code = errorCode.getCode();
        this.message = message;
        this.data = data;
    }

    /**
     * 成功返回结果
     *
     * @param data 获取的数据
     */
    public static <T> CommonResult<T> success(final T data) {
        return new CommonResult<T>(ResultCode.SUCCESS, ResultCode.SUCCESS.getMessage(), data);
    }

    /**
     * 成功返回结果
     *
     * @param data    获取的数据
     * @param message 提示信息
     */
    public static <T> CommonResult<T> success(final T data, final String message) {
        return new CommonResult<T>(ResultCode.SUCCESS, message, data);
    }

    /**
     * 失败返回结果
     */
    public static <T> CommonResult<T> failed(final IErrorCode errorCode) {
        return new CommonResult<T>(errorCode, errorCode.getMessage(), null);
    }

    /**
     * 失败返回结果
     */
    public static <T> CommonResult<T> failed(final ResultCode errorCode, final String message) {
        return new CommonResult<T>(errorCode, message, null);
    }

    /**
     * 失败返回结果
     */
    public static <T> CommonResult<T> failed(final String message) {
        return new CommonResult<T>(ResultCode.FAILED, message, null);
    }

    /**
     * 失败返回结果
     */
    public static <T> CommonResult<T> failed() {
        return failed(ResultCode.FAILED);
    }

    /**
     * 参数验证失败返回结果
     */
    public static <T> CommonResult<T> validateFailed() {
        return failed(ResultCode.VALIDATE_FAILED);
    }

    /**
     * 参数验证失败返回结果
     *
     * @param message 提示信息
     */
    public static <T> CommonResult<T> validateFailed(final String message) {
        return new CommonResult<T>(ResultCode.VALIDATE_FAILED, message, null);
    }

    /**
     * 未登录返回结果
     */
    public static <T> CommonResult<T> unauthorized(final T data) {
        return new CommonResult<T>(ResultCode.UNAUTHORIZED, ResultCode.UNAUTHORIZED.getMessage(), data);
    }

    /**
     * 未授权返回结果
     */
    public static <T> CommonResult<T> forbidden(final T data) {
        return new CommonResult<T>(ResultCode.FORBIDDEN, ResultCode.FORBIDDEN.getMessage(), data);
    }

    public IErrorCode getErrorCode() {
        return errorCode;
    }

    public long getCode() {
        return code;
    }

    public void setErrorCode(ResultCode errorCode) {
        this.errorCode = errorCode;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public T getData() {
        return data;
    }

    public void setData(T data) {
        this.data = data;
    }
}
