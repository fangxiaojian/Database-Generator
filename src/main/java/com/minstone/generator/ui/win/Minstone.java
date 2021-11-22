package com.minstone.generator.ui.win;

import com.minstone.generator.config.Developer;
import com.minstone.generator.config.Options;
import com.minstone.generator.config.Settings;
import com.minstone.generator.util.PluginUtils;
import com.google.common.collect.Maps;
import com.intellij.ide.highlighter.JavaFileType;
import com.intellij.ide.util.PackageChooserDialog;
import com.intellij.openapi.editor.Document;
import com.intellij.openapi.project.Project;
import com.intellij.psi.JavaCodeFragment;
import com.intellij.psi.JavaCodeFragmentFactory;
import com.intellij.psi.PsiDocumentManager;
import com.intellij.psi.PsiPackage;
import com.intellij.ui.EditorTextField;
import org.jetbrains.annotations.NotNull;

import javax.swing.*;
import javax.swing.event.DocumentEvent;
import javax.swing.event.DocumentListener;
import javax.swing.text.JTextComponent;
import java.awt.event.ItemEvent;
import java.awt.event.ItemListener;
import java.util.Map;
import java.util.Set;
import java.util.function.Consumer;

/**
 * @Author fanghanj
 * @Email fanghanj@minstone.com.cn
 * @Date 2021/11/22 15:31
 */
public class Minstone implements IWindows {
    /**
     * 配置对象：设置信息
     */
    private final Settings settings;
    /**
     * 配置对象：是否覆盖文件
     */
    private final Options options;
    /**
     * 配置对象：开发者信息
     */
    private final Developer developer;
    /**
     * 输入框：Model后缀
     */
    private JTextField modelSuffixField;
    /**
     * 输入框：Model包名
     */
    private EditorTextField modelPackageField;
    /**
     * 按钮：Model 包选择
     */
    private JButton selectModelPackageButton;
    /**
     * 输入框：Mapper后缀
     */
    private JTextField mapperSuffixField;
    /**
     * 输入框：Mapper包名
     */
    private EditorTextField mapperPackageField;
    /**
     * 按钮：Mapper 包选择
     */
    private JButton selectMapperPackageButton;
    /**
     * 输入框：Service后缀
     */
    private JTextField serviceSuffixField;
    /**
     * 输入框：Service包名
     */
    private EditorTextField servicePackageField;
    /**
     * 按钮：Service 包选择
     */
    private JButton selectServicePackageButton;
    /**
     * 输入框：ServiceImpl后缀
     */
    private JTextField serviceImplSuffixField;
    /**
     * 输入框：ServiceImpl包名
     */
    private EditorTextField serviceImplPackageField;
    /**
     * 按钮：ServiceImpl 包选择
     */
    private JButton selectServiceImplPackageButton;
    /**
     * 输入框：Restful后缀
     */
    private JTextField restfulSuffixField;
    /**
     * 输入框：Restful包名
     */
    private EditorTextField restfulPackageField;
    /**
     * 按钮：Restful 包选择
     */
    private JButton selectRestfulPackageButton;
    /**
     * 输入框：开发者姓名
     */
    private JTextField authorField;
    /**
     * 输入框：电子邮件
     */
    private JTextField emailField;
    /**
     * 面板：顶级页面面板
     */
    private JPanel content;
    /**
     * 复选：是否覆盖Java文件
     */
    private JCheckBox overrideJavaCheckBox;
    /**
     * 复选：是否覆盖XML文件
     */
    private JCheckBox overrideXmlCheckBox;
    /**
     * 复选：是否覆盖其他文件
     */
    private JCheckBox overrideOtherCheckBox;

    public Minstone(Settings settings, Developer developer, Options options) {
        this.settings = settings;
        this.developer = developer;
        this.options = options;
        initConfig();
        configSelectPackage();

        /* 普通输入框的输入事件监听 */
        class TextFieldDocumentListener implements DocumentListener {
            /**
             * 存放 setValue 与 输入框 的关系
             */
            private final Map<Consumer<String>, JTextComponent> map = Maps.newHashMap();

            public TextFieldDocumentListener() {
                map.put(developer::setAuthor, authorField);
                map.put(developer::setEmail, emailField);
                map.put(settings::setModelSuffix, modelSuffixField);
                map.put(settings::setMapperSuffix, mapperSuffixField);
                map.put(settings::setServiceSuffix, serviceSuffixField);
                map.put(settings::setServiceImplSuffix, serviceImplSuffixField);
                map.put(settings::setRestfulSuffix, restfulSuffixField);
            }

            @Override
            public void insertUpdate(DocumentEvent e) {
                documentChanged(e);
            }

            @Override
            public void removeUpdate(DocumentEvent e) {
                documentChanged(e);
            }

            @Override
            public void changedUpdate(DocumentEvent e) {
            }

            /**
             * swing 输入框组件内容更改事件
             *
             * @param e 事件
             */
            public void documentChanged(DocumentEvent e) {
                javax.swing.text.Document document = e.getDocument();
                Set<Map.Entry<Consumer<String>, JTextComponent>> entries = map.entrySet();
                for (Map.Entry<Consumer<String>, JTextComponent> entry : entries) {
                    if (TextFieldDocumentUtil.updateSettingValue(document, entry.getValue(), entry.getKey())) {
                        break;
                    }
                }
            }
        }

        TextFieldDocumentListener textFieldDocumentListener = new TextFieldDocumentListener();
        authorField.getDocument().addDocumentListener(textFieldDocumentListener);
        emailField.getDocument().addDocumentListener(textFieldDocumentListener);
        modelSuffixField.getDocument().addDocumentListener(textFieldDocumentListener);
        mapperSuffixField.getDocument().addDocumentListener(textFieldDocumentListener);
        serviceSuffixField.getDocument().addDocumentListener(textFieldDocumentListener);
        serviceImplSuffixField.getDocument().addDocumentListener(textFieldDocumentListener);
        restfulSuffixField.getDocument().addDocumentListener(textFieldDocumentListener);

        /* 包名输入框的输入事件监听 */
        class EditorTextFieldDocumentListener implements com.intellij.openapi.editor.event.DocumentListener {
            /**
             * 存放 setValue 与 输入框 的关系
             */
            private final Map<Consumer<String>, EditorTextField> map = Maps.newHashMap();

            public EditorTextFieldDocumentListener() {
                map.put(settings::setModelPackage, modelPackageField);
                map.put(settings::setMapperPackage, mapperPackageField);
                map.put(settings::setServicePackage, servicePackageField);
                map.put(settings::setServiceImplPackage, serviceImplPackageField);
                map.put(settings::setRestfulPackage, restfulPackageField);
            }

            /**
             * IDEA 输入框组件内容更改事件
             *
             * @param event 事件
             */
            @Override
            public void documentChanged(@NotNull com.intellij.openapi.editor.event.DocumentEvent event) {
                Document document = event.getDocument();
                Set<Map.Entry<Consumer<String>, EditorTextField>> entries = map.entrySet();
                for (Map.Entry<Consumer<String>, EditorTextField> entry : entries) {
                    if (TextFieldDocumentUtil.updateSettingValue(document, entry.getValue(), entry.getKey())) {
                        break;
                    }
                }
            }
        }

        EditorTextFieldDocumentListener editorTextFieldDocumentListener = new EditorTextFieldDocumentListener();
        modelPackageField.getDocument().addDocumentListener(editorTextFieldDocumentListener);
        mapperPackageField.getDocument().addDocumentListener(editorTextFieldDocumentListener);
        servicePackageField.getDocument().addDocumentListener(editorTextFieldDocumentListener);
        serviceImplPackageField.getDocument().addDocumentListener(editorTextFieldDocumentListener);
        restfulPackageField.getDocument().addDocumentListener(editorTextFieldDocumentListener);

        ItemListener checkBoxItemListener = new ItemListener() {
            /**
             * 复选框勾选事件监听
             * @param e 事件
             */
            @Override
            public void itemStateChanged(ItemEvent e) {
                Object item = e.getItem();
                if (overrideJavaCheckBox == item) {
                    options.setOverrideJava(overrideJavaCheckBox.isSelected());
                } else if (overrideXmlCheckBox == item) {
                    options.setOverrideXml(overrideXmlCheckBox.isSelected());
                } else if (overrideOtherCheckBox == item) {
                    options.setOverrideOther(overrideOtherCheckBox.isSelected());
                }
            }
        };
        overrideJavaCheckBox.addItemListener(checkBoxItemListener);
        overrideXmlCheckBox.addItemListener(checkBoxItemListener);
        overrideOtherCheckBox.addItemListener(checkBoxItemListener);
    }

    private void createUIComponents() {
        Project project = PluginUtils.getProject();
        modelPackageField = createEditorTextField(project);
        mapperPackageField = createEditorTextField(project);
        servicePackageField = createEditorTextField(project);
        serviceImplPackageField = createEditorTextField(project);
        restfulPackageField = createEditorTextField(project);
    }

    /**
     * 创建一个可以自动补全包名的输入框
     *
     * @param project 项目
     * @return IDEA 输入框组件
     */
    private EditorTextField createEditorTextField(Project project) {
        // https://jetbrains.org/intellij/sdk/docs/user_interface_components/editor_components.html
        JavaCodeFragment code = JavaCodeFragmentFactory.getInstance(project).createReferenceCodeFragment("", null, true, false);
        Document document = PsiDocumentManager.getInstance(project).getDocument(code);
        JavaFileType fileType = JavaFileType.INSTANCE;
        return new EditorTextField(document, project, fileType);
    }

    /**
     * 配置选择包名的按钮事件
     */
    private void configSelectPackage() {
        selectModelPackageButton.addActionListener(e -> {
            chooserPackage(modelPackageField.getText(), modelPackageField::setText);
        });
        selectMapperPackageButton.addActionListener(e -> {
            chooserPackage(mapperPackageField.getText(), mapperPackageField::setText);
        });
        selectServicePackageButton.addActionListener(e -> {
            chooserPackage(servicePackageField.getText(), servicePackageField::setText);
        });
        selectServiceImplPackageButton.addActionListener(e -> {
            chooserPackage(serviceImplPackageField.getText(), serviceImplPackageField::setText);
        });
        selectRestfulPackageButton.addActionListener(e -> {
            chooserPackage(restfulPackageField.getText(), restfulPackageField::setText);
        });
    }

    /**
     * 选择包名
     *
     * @param defaultSelect 默认选中包名
     * @param consumer      完成事件
     */
    private void chooserPackage(String defaultSelect, Consumer<String> consumer) {
        PackageChooserDialog chooser = new PackageChooserDialog("请选择模块包", PluginUtils.getProject());
        chooser.selectPackage(defaultSelect);
        chooser.show();
        PsiPackage psiPackage = chooser.getSelectedPackage();
        if (psiPackage != null) {
            consumer.accept(psiPackage.getQualifiedName());
        }
        chooser.getDisposable().dispose();
    }

    /**
     * 初始化开发者信息的输入框内容
     */
    private void initConfig() {
        authorField.setText(developer.getAuthor());
        emailField.setText(developer.getEmail());

        modelSuffixField.setText(settings.getModelSuffix());
        mapperSuffixField.setText(settings.getMapperSuffix());
        serviceSuffixField.setText(settings.getServiceSuffix());
        serviceImplSuffixField.setText(settings.getServiceImplSuffix());
        restfulSuffixField.setText(settings.getRestfulSuffix());

        modelPackageField.setText(settings.getModelPackage());
        mapperPackageField.setText(settings.getMapperPackage());
        servicePackageField.setText(settings.getServicePackage());
        serviceImplPackageField.setText(settings.getServiceImplPackage());
        restfulPackageField.setText(settings.getRestfulPackage());

        overrideJavaCheckBox.setSelected(options.isOverrideJava());
        overrideXmlCheckBox.setSelected(options.isOverrideXml());
        overrideOtherCheckBox.setSelected(options.isOverrideOther());
    }

    @Override
    public JPanel getContent() {
        return content;
    }
}
